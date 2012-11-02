//
//  Cell.m
//  DNA
//
//  Created by Александр Борунов on 01.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//



#import "Cell.h"
#import "Protein.h"



@implementation Cell

// просто создавалка (Protein устанавливается по умолчанию случайно
- (id) init {
    self = [super init];
    if (self){
        chain = [[NSMutableArray alloc] init]; // создали пустую цепочку
        for (int i=0; i < CHAIN_LENGTH; i++) { // добавим CHAIN_LENGTH элементов
            [chain addObject:[[Protein alloc]init] ]; // добавили в цепочку вновьсосзданный Protein
        }
    }
    return self;
}


// создавалка поэлементным копированием. в смысле создаем _новый_ элемент и делаем его таким же как у исходника
- (id) initFromCell: (Cell*)sourceCell{
    self = [super init];
    if (self){
        chain = [[NSMutableArray alloc] init]; // создали пустую цепочку
        for (int i=0; i < CHAIN_LENGTH; i++) { // добавим CHAIN_LENGTH элементов
            switch ([[sourceCell->chain objectAtIndex:i] get]) {
                case 'A': { Protein *p =[[Protein alloc]init]; [p setA]; [chain addObject:p]; break; }
                case 'T': { Protein *p =[[Protein alloc]init]; [p setT]; [chain addObject:p]; break; }
                case 'G': { Protein *p =[[Protein alloc]init]; [p setG]; [chain addObject:p]; break; }
                case 'C': { Protein *p =[[Protein alloc]init]; [p setC]; [chain addObject:p]; break; }
            }
        }
    }
    return self;
}

// создавалка из строчки. в смысле создаем _новый_ элемент и делаем его таким же как символ строки
- (id) initFromString: (NSString*)sourceString{
    self = [super init];
    if (self){
        chain = [[NSMutableArray alloc] init]; // создали пустую цепочку
        // вообще, исходная строка может быть как больше CHAIN_LENGTH так и меньше
        // в первом случае мы больше чем можно от нее не возьмем,
        // во втором добьем случайными
        
        int stringlen = (int)[sourceString length];
        int copyLength = (stringlen > CHAIN_LENGTH ) ? CHAIN_LENGTH : stringlen ; 
        for (int i=0; i < copyLength; i++) { // добавим из строки copyLength элементов
            switch ([sourceString characterAtIndex:i]) {
                case 'A': { Protein *p =[[Protein alloc]init]; [p setA]; [chain addObject:p]; break; }
                case 'T': { Protein *p =[[Protein alloc]init]; [p setT]; [chain addObject:p]; break; }
                case 'G': { Protein *p =[[Protein alloc]init]; [p setG]; [chain addObject:p]; break; }
                case 'C': { Protein *p =[[Protein alloc]init]; [p setC]; [chain addObject:p]; break; }
                default : { Protein *p =[[Protein alloc]init]; [chain addObject:p]; break; } // если не угадал то случайно
            }
        }
        // скопировали все что было, теперь если надо добьем случайными
        for (int i=copyLength; i < CHAIN_LENGTH; i++) {
            Protein *p =[[Protein alloc]init]; // он тут станет случайным по умолчанию
            [chain addObject:p];
        }
    }
    return self;
    
}





- (int) hammingDistance: (Cell*)comparedCell {
// я понимаю что так итерировать не хорошо. но я правда не знаю как можно
// воспользоваться одним NSEnumerator для двух массивов одинакового размера
    int differences = 0;
    for (int i=0; i < CHAIN_LENGTH; i++){
        if ( [[self->chain objectAtIndex:i] get] != [[comparedCell->chain objectAtIndex:i] get] ) differences++;
    }
    return differences;
}

- (void) print {
    NSMutableString *result = [NSMutableString string]; // создадим строку куда будем копировать Protein посимвольно
    for (int i=0; i < CHAIN_LENGTH; i++){
        char proteinLetter = [[chain objectAtIndex:i] get];  // взяли i-ю букву
        [result appendFormat:@"%c", proteinLetter];          // и добавили к строке
    }
    NSLog(@"%@",result);
}
    




/*
// понимаем что print работает не зная о количестве элементов в массиве
- (void) print {
    Protein *currentProtein;  // это будет текущим элементом массива
    NSEnumerator *myEnumerator = [chain objectEnumerator];  // а этим побежим по массиву
    while (currentProtein = [myEnumerator nextObject]) {
        [currentProtein print];  // печатая каждый элемент
    }
}
*/

// проверочка. элемент index устанавливаем в A
- (void) setAinIndex: (int) index {
    [[chain objectAtIndex:index] setA];
}



@end

