
#import "Cell.h"

@implementation Cell{
    
}
    
//Переопределяем метод init, в нем инициализируем переменную dna
- (id) init {self = [super init];
    dnaLength = 100;

    if (self){
        //Массив возможных значений
        atgcArray = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    
        //Создаем массив ДНК
        dna = [NSMutableArray arrayWithCapacity: dnaLength];
   
        //и наполняем его случайными значениями
        for (int i = 0 ; i < dnaLength; i++) {
            int element = random() % 4;
            [dna addObject:[atgcArray objectAtIndex:element]];

        }
        NSLog(@"new DNA: %@", dna);
    };
    
    return self;
};
     
- (int) hammingDistance: (Cell*) cell{
    
    int counter = 0;   //счетчик отличий
    
    for (int i = 0 ; i < dnaLength; i++) {
        if ([[dna objectAtIndex:i] characterAtIndex:0] != [[cell->dna objectAtIndex:i] characterAtIndex:0])
        {counter ++;
        };
    };
    return counter;
};


@end
