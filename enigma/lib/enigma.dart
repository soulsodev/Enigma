import 'dart:developer';
import 'constants.dart';

void shiftRotor(var n, var shCount) {
  log('Shift');
  var temp = [];

  for (var i = 0; i < shCount; i++) {
    log('rotor number: ' + n.toString());
    log('letter: ' + rotor[n][n + 1].toString());
    log('first letter: ' + firstRotorLetter[n].toString());
    if (rotor[n][i + 1] == firstRotorLetter[n] && n > 1) {
      shiftRotor(n - 1, 1);
    }
  }
  for (var i = 0; i < rotor[n].length; i++) {
    if (i + shCount >= rotor[n].length) {
      temp.add(rotor[n][(i + shCount) % rotor[n].length]);
    } else {
      temp.add(rotor[n][i + shCount]);
    }
  }
  for (var i = 0; i < rotor[n].length; i++) {
    rotor[n][i] = temp[i];
  }
}

String enigma(var message) {
  var result;
  var key = message.toLowerCase();
  log('Enigma');
  log('key: $key');
  var keySH = key.split('');
  for (var k = 0; k < key.length; k++) {
    for (var n = rotor.length - 1; n > 0; n--) {
      keySH[k] = rotor[n][rotor[0].indexOf(keySH[k])];
    }
    for (var e in reflector.entries) {
      if (keySH[k] == e.key) {
        keySH[k] = e.value;
      } else if (keySH[k] == e.value) {
        keySH[k] = e.key;
      }
    }
    for (var n = 1; n < rotor.length; n++) {
      keySH[k] = rotor[0][rotor[n].indexOf(keySH[k])];
    }
    for (var i = rotor.length - 1; i > 1; i--) {
      shiftRotor(i, rotorShifts[i - 1]);
    }
  }
  result = keySH.join('');
  log('result: $result');
  return result;
}
