import 'dart:math';

const String AND_GATE = 'AND';
const String NAND_GATE = 'NAND';
const String OR_GATE = 'OR';
const String NOR_GATE = 'NOR';
const String XOR_GATE = 'XOR';
const String XNOR_GATE = 'XNOR';

const List<num> E3Series =  [10.0, 22.0, 47.0];
const List<num> E6Series =  [10.0, 15.0, 22.0, 33.0, 47.0, 68.0];
const List<num> E12Series = [10.0, 12.0, 15.0, 18.0, 22.0, 27.0, 33.0, 39.0, 47.0, 56.0, 68.0, 82.0];
const List<num> E24Series = [10.0, 11.0, 12.0, 13.0, 15.0, 16.0, 18.0, 20.0, 22.0, 24.0, 27.0, 30.0,
                             33.0, 36.0, 39.0, 43.0, 47.0, 51.0, 56.0, 62.0, 68.0, 75.0, 82.0, 91.0];
const List<num> E48Series =  [100.0, 105.0, 110.0, 115.0, 121.0, 127.0, 133.0, 140.0, 147.0, 154.0, 162.0, 169.0,
                              178.0, 187.0, 196.0, 205.0, 215.0, 226.0, 237.0, 249.0, 261.0, 274.0, 287.0, 301.0, 
                              316.0, 332.0, 348.0, 365.0, 383.0, 402.0, 422.0, 442.0, 464.0, 487.0, 511.0, 536.0, 
                              562.0, 590.0, 619.0, 649.0, 681.0, 715.0, 750.0, 787.0, 825.0, 866.0, 909.0, 953.0];
const List<num> E96Series =  [100.0, 102.0, 105.0, 107.0, 110.0, 113.0, 115.0, 118.0, 121.0, 124.0, 127.0, 130.0,
                              133.0, 137.0, 140.0, 143.0, 147.0, 150.0, 154.0, 158.0, 162.0, 165.0, 169.0, 174.0, 
                              178.0, 182.0, 187.0, 191.0, 196.0, 200.0, 205.0, 210.0, 215.0, 221.0, 226.0, 232.0, 
                              237.0, 243.0, 249.0, 255.0, 261.0, 267.0, 274.0, 280.0, 287.0, 294.0, 301.0, 309.0, 
                              316.0, 324.0, 332.0, 340.0, 348.0, 357.0, 365.0, 374.0, 383.0, 392.0, 402.0, 412.0, 
                              422.0, 432.0, 442.0, 453.0, 464.0, 475.0, 487.0, 499.0, 511.0, 523.0, 536.0, 549.0, 
                              562.0, 576.0, 590.0, 604.0, 619.0, 634.0, 649.0, 665.0, 681.0, 698.0, 715.0, 732.0, 
                              750.0, 768.0, 787.0, 806.0, 825.0, 845.0, 866.0, 887.0, 909.0, 931.0, 953.0, 976.0];
const List<num> E192Series =  [100.0, 101.0, 102.0, 104.0, 105.0, 106.0, 107.0, 109.0, 110.0, 111.0, 113.0, 114.0,
                               115.0, 117.0, 118.0, 120.0, 121.0, 123.0, 124.0, 126.0, 127.0, 129.0, 130.0, 132.0,
                               133.0, 135.0, 137.0, 138.0, 140.0, 142.0, 143.0, 145.0, 147.0, 149.0, 150.0, 152.0, 
                               154.0, 156.0, 158.0, 160.0, 162.0, 164.0, 165.0, 167.0, 169.0, 172.0, 174.0, 176.0, 
                               178.0, 180.0, 182.0, 184.0, 187.0, 189.0, 191.0, 193.0, 196.0, 198.0, 200.0, 203.0, 
                               205.0, 208.0, 210.0, 213.0, 215.0, 218.0, 221.0, 223.0, 226.0, 229.0, 232.0, 234.0, 
                               237.0, 240.0, 243.0, 246.0, 249.0, 252.0, 255.0, 258.0, 261.0, 264.0, 267.0, 271.0, 
                               274.0, 277.0, 280.0, 284.0, 287.0, 291.0, 294.0, 298.0, 301.0, 305.0, 309.0, 312.0, 
                               316.0, 320.0, 324.0, 328.0, 332.0, 336.0, 340.0, 344.0, 348.0, 352.0, 357.0, 361.0, 
                               365.0, 370.0, 374.0, 379.0, 383.0, 388.0, 392.0, 397.0, 402.0, 407.0, 412.0, 417.0, 
                               422.0, 427.0, 432.0, 437.0, 442.0, 448.0, 453.0, 459.0, 464.0, 470.0, 475.0, 481.0, 
                               487.0, 493.0, 499.0, 505.0, 511.0, 517.0, 523.0, 530.0, 536.0, 542.0, 549.0, 556.0, 
                               562.0, 569.0, 576.0, 583.0, 590.0, 597.0, 604.0, 612.0, 619.0, 626.0, 634.0, 642.0, 
                               649.0, 657.0, 665.0, 673.0, 681.0, 690.0, 698.0, 706.0, 715.0, 723.0, 732.0, 741.0, 
                               750.0, 759.0, 768.0, 777.0, 787.0, 796.0, 806.0, 816.0, 825.0, 835.0, 845.0, 856.0, 
                               866.0, 876.0, 887.0, 898.0, 909.0, 920.0, 931.0, 942.0, 953.0, 965.0, 976.0, 988.0];

final num nano = pow(10, -9);
final num micro = pow(10, -6);
final num milli = pow(10, -3);
final num cent =  pow(10, -2);
const num normalMultiplier = 1.0;
final num kilo =  pow(10, 3);
final num mega =  pow(10, 6);
final num giga =  pow(10, 9);
final num tera =  pow(10, 12);
const num msTokmh = 3.6;
final num msTocs = 1/cent;
const num speedOfLight = 299792458.0;
final num planckConstant = 6.6261 * pow(10, -34);
final num toElectronvolt = 6.241509 * pow(10, 18);

final Map<String, int> resitanceButtonsValues = {
  '1 Ω' : 1,
  '10 Ω' : 10,
  '100 Ω' : 100,
  '1 kΩ' : 1000,
  '10 kΩ' : 10000,
  '100 kΩ' : 100000,
  '1 MΩ' : 1000000,
  '10 MΩ' : 10000000,
  '100 MΩ' : 100000000,
  '1 GΩ' : 1000000000,
};