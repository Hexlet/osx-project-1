@interface Cell : NSObject {
    NSMutableArray* dna; // последовательность ДНК
    int dnaLength;       //длина последовательности
    NSArray *atgcArray;  //массив возможных значений ячейки
}
- (int) hammingDistance: (Cell*) cell;  //определение различия двух цепей днк
@end
