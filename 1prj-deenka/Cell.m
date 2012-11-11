//
//  Cell.m
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// свой init
-(id) init {
    
    self = [super init];
    if (self) {
        
        DNA_bases = @"ATGC";
        
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        
//            NSLog (@"Конструктор инициирует ДНК: %li", [DNA count ]); //debug
        // почему цикл не крутится никак не пойму ... ага [DNA count] виноват, он же пока 0!
        // 10 для начала - так легче дебагить, для FINAL не забыть поменять на 100
        
        for (i=0; i<10; i++) {
            
//            j=arc4random();
//            NSLog(@"rand %i & %i", j, j%4);
// arc4random рандомнее, чем просто random - по крайней мере, с каждым run выдает новые значения
//            NSLog(@"%i",arc4random());
//            unichar hz2=[DNA_bases characterAtIndex:1];
            // characterAtIndex returns unichar
            [DNA addObject:[NSString stringWithFormat:@"%c",[DNA_bases characterAtIndex:(unsigned int) arc4random()%4 ]]];
//             [DNA addObject:[DNA_bases characterAtIndex:(unsigned int) arc4random()%4 ]];
            
            // напишу, пожалуй, весь проект в одно строчку. Потом ради смеха сразу в кексах.
//            NSLog (@"Конструктор заполняет ДНК: %li", [DNA count ]); //debug
        }
    }
    else {
       NSLog (@"self почему-то не вернулся");
        }

    return self;
}


- (int) hammingDistance: (Cell*) partner {

    NSMutableArray *DNA2=partner->DNA;
    
    int hd=0;
    
    for (i=0; i<10; i++) {
 
        if ([DNA objectAtIndex:i] != [DNA2 objectAtIndex:i]) hd++;

        //NSLog(@"L vs. K: %@-%@",[DNA objectAtIndex:i],[DNA2 objectAtIndex:i]);
    }
//        NSLog (@"%@ vs. %@", DNA, DNA2);
    return hd;
}


- (void) print {
    
    //NSLog (@"Two");
    //NSLog (@"%@", DNA_bases);
    //NSLog (@"%@%@%@", [DNA objectAtIndex:0],[DNA objectAtIndex:5],[DNA objectAtIndex:9]); //[DNA count ]
    NSLog (@"%@", DNA);
}

@end
