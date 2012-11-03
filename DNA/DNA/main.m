#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)                                   //объявление категории
- (void) mutate: (int) mutationPercentage;
@end


//**********************       MAIN      ***************************************

int main(int argc, const char * argv[])             {

    Cell *dna1 = [[Cell alloc] init];
    Cell *dna2 = [[Cell alloc] init];
   
    NSLog (@"Hamming distance is: %i", [dna1 hammingDistance:dna2]);

    [dna1 mutate:30];
    [dna2 mutate:30];
    
    NSLog (@"Hamming distance after mutation is: %i", [dna1 hammingDistance:dna2]);

    return 0;
}
//*******************************************************************************



@implementation Cell (mutator)                         //имплементация категории

- (void) mutate: (int) mutationPercentage {             //изменяет mutationPercentage процентов исходной цепи ДНК
   
    NSMutableArray *numbersInOrder = [NSMutableArray arrayWithCapacity: dnaLength];     //массив порядковых чисел для выборки

    for (int i = 0; i<dnaLength; i++){
        NSNumber *number = [[NSNumber alloc] initWithInt:i];
        [numbersInOrder addObject:number];
    }

   
    int numOfCellsToMutate = dnaLength*mutationPercentage/100; //количество ячеек, которые мутируют

    NSMutableArray *numbersToMutate = [NSMutableArray arrayWithCapacity: numOfCellsToMutate];     //массив случайных номеров

    for (int i = 0; i<numOfCellsToMutate; i++){                                         
        int randomPosition = random() % (int)[numbersInOrder count];                            //берем случайный номер
        [numbersToMutate addObject:[numbersInOrder objectAtIndex:randomPosition]];              //добавляем в numbersToMutate
        [numbersInOrder removeObjectAtIndex:randomPosition];                                    //удаляем из исходного массива номеров
    }
    
    
    for (int i = 0; i<numOfCellsToMutate; i++) {
        
        int dnaPositionToMutate =[[numbersToMutate objectAtIndex:i] intValue];
        id cellCurrentState = [dna objectAtIndex:dnaPositionToMutate];
        id mutatedType;
        
        //случайно выбираем, в какое состояние мутировать
        //до тех пор, пока исходное значение не изменится
       do {
      mutatedType  = [atgcArray objectAtIndex:random() % 4];
        
       } while ( [mutatedType characterAtIndex:0] == [cellCurrentState characterAtIndex:0] );
       
    [dna replaceObjectAtIndex:dnaPositionToMutate withObject: mutatedType];
    };
    
    
    NSLog(@"mutated DNA: %@", dna);
    

};
@end

