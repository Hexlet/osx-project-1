//
//  main.m
//  DNA
//
//  Created by Oleg on 05.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (bioHazard)
- (void)mutate:(int)mutatingPercent;
@end

@implementation Cell (BioHazard)
-(void)mutate:(int)mutatingPercent {

    if (mutatingPercent <=   0) return;                                  //Защита от дурака, если меньше или 0 то выходим
    if (mutatingPercent > 100) mutatingPercent = 100;                    //Если больше 100 то пусть будет 100
    
    NSArray * markerArry = [[NSArray alloc] initWithArray:DNA];          //Создаю массив маркеров которые паказывают изменялся-ли элемент DNA массива.
    
    int randPnt;
    int mutatingCount;
    
    mutatingCount = mutatingPercent * sizeofDNA / 100;                              //ЗАМЕНЯЕТ СТРОГО X процентов
    
    for (int i = 0; i < (mutatingCount - 1); i++) {                                 //Цикл "мутации"
        do {                                                                        //Цикл изменеия с проверкой, если пытаюсь изменить элемент
            randPnt = arc4random() %(sizeofDNA - 1);                                //который уже изменён, то рандомайземся заново.
            
            if ([[markerArry objectAtIndex: randPnt] isNotEqualTo:[DNA objectAtIndex:randPnt]]) continue;
            else {
                NSString * randomTemp = self.randomNuclide;
                if ([randomTemp isEqualToString: [DNA objectAtIndex:randPnt]]) continue; //Если пытаюсь изменить на тоже самое значение, то перход на новую попытку.
                [DNA replaceObjectAtIndex:randPnt withObject:randomTemp];                //Если изменение первично, то оно вноситя в элемент массива
                break;                                                                   //и выхожу из do цикла.
            }
        } while (1);
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell;
        myCell = [[Cell alloc]init];

        Cell *myCell2;
        myCell2 = [[Cell alloc]init];
        
        NSLog(@"hamming distance = %i", [myCell hammingDistance:myCell2]);
        
        [myCell mutate:20];
        [myCell2 mutate:70];
 
        NSLog(@"hamming distance = %i", [myCell hammingDistance:myCell2]);
        
    }
    return 0;
}

