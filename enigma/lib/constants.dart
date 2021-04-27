final rotors = [
  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
    'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z'],
  // Rotor VIII
  ['f', 'k', 'q', 'h', 't', 'l', 'x', 'o', 'c',
    'b', 'j', 's', 'p', 'd', 'z', 'r', 'a', 'm',
    'e', 'w', 'n', 'i', 'u', 'y', 'g', 'v'],
  // Rotor II
  ['a', 'j', 'd', 'k', 's', 'i', 'r', 'u', 'x',
    'b', 'l', 'h', 'w', 't', 'm', 'c', 'q', 'g',
    'z', 'n', 'p', 'y', 'f', 'v', 'o', 'e'],
  // Rotor IV
  ['e', 's', 'o', 'v', 'p', 'z', 'j', 'a', 'y',
    'q', 'u', 'i', 'r', 'h', 'x', 'l', 'n', 'f',
    't', 'g', 'k', 'd', 'c', 'm', 'w', 'b']
];

// Reflector B
final reflector = {
  'a': 'y',
  'b': 'r',
  'c': 'u',
  'd': 'h',
  'e': 'q',
  'f': 's',
  'g': 'l',
  'i': 'p',
  'j': 'x',
  'k': 'n',
  'm': 'o',
  't': 'z',
  'v': 'w'
};

final rotorShifts = [1, 0, 1];
var firstRotorLetter = ['a', rotors[1][0], rotors[2][0], rotors[3][0]];
var rotor = [];

