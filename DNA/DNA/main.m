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

    NSUInteger marker[100] = {0};                               //Создаю массив маркеров которые паказывают изменялся-ли элемент DNA массива.
        
    int randPnt;
    int mutatingCount;
    
    if (mutatingPercent <=   0) return;
    if (mutatingPercent > 100) mutatingPercent = 100;
    
    mutatingCount = mutatingPercent * 100 / 100;                                    //ЗАМЕНЯЕТ СТРОГО X процентов :)
    
    for (int i = 0; i < (mutatingCount - 1); i++) {                                 //Цикл "мутации"
        do {                                                                        //Цикл изменеия с проверкой, если пытаюсь изменить элемент
            randPnt = arc4random() % 99;                                            //который уже изменён, то рандомайземся заново.
            
            if (marker[randPnt]) continue;
            else {
                NSString * randomTemp = self.randomNuclide;
                if ([randomTemp isEqualToString: [DNA objectAtIndex:randPnt]]) continue; //Если пытаюсь изменить на тоже самое значение, то перход на новую попытку.
                [DNA replaceObjectAtIndex:randPnt withObject:randomTemp];                //Если изменение первично, то оно вноситя в DNA
                marker[randPnt] = 1;                                                     //и элемент массива помечается как изменённый
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

