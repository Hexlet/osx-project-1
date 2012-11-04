#import "Cell+mutator.h"

@implementation Cell (mutator)                         //имплементация категории

- (void) mutate: (int) mutationPercentage {             //заменяет mutationPercentage процентов исходной цепи ДНК
    
    NSMutableArray *numbersInOrder = [NSMutableArray arrayWithCapacity: dnaLength];     //массив порядковых чисел для выборки
    int numOfCellsToMutate = dnaLength*mutationPercentage/100;                          //количество ячеек, которые мутируют
    
    //наполняем массив порядковыми номерами
    for (int i = 0; i<dnaLength; i++){
        NSNumber *number = [[NSNumber alloc] initWithInt:i];
        [numbersInOrder addObject:number];
    };
    
    NSMutableArray *numbersToMutate = [NSMutableArray arrayWithCapacity: numOfCellsToMutate];     //массив случайных номеров
    
    for (int i = 0; i<numOfCellsToMutate; i++){
        int randomPosition = random() % (int)[numbersInOrder count];                            //берем случайный номер
        [numbersToMutate addObject:[numbersInOrder objectAtIndex:randomPosition]];              //добавляем в numbersToMutate
        [numbersInOrder removeObjectAtIndex:randomPosition];                                    //удаляем из исходного массива номеров
    };

        
    //----------ЭТОТ ЦИКЛ ПРОХОДИТ ПО ВСЕМ ЯЧЕЙКАМ ДНК--------------------------------
    //                  и заменяет нуклеотиды
    
    for (int i = 0; i<numOfCellsToMutate; i++) { 

        NSMutableArray *atgcToMutateArray = [[NSMutableArray alloc] initWithArray:atgcArray];  //копия массива возможных значений
       
        int currentDnaNumber = [[numbersToMutate objectAtIndex:i] intValue];  //номер текущей ячейки dna
        id currentState = [dna objectAtIndex:currentDnaNumber];               //состояние текущей ячейки
        [atgcToMutateArray removeObjectIdenticalTo: currentState];            //удаляем из копии нуклеотид, эквивалентный текущему значению
        
        [dna replaceObjectAtIndex:currentDnaNumber withObject:[atgcToMutateArray objectAtIndex:random() %2]];    //случайным образом выбираем, во что мутировать
        
    };//--------------------------------------------------------------------------------
    
    
    NSLog(@"mutated DNA: %@", dna);
    
    
};
@end


