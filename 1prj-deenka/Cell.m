//
//  Cell.m
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
    NSString *DNA_bases;
    int i, j;
}

// свой init
-(id) init {
    
    self = [super init];
    if (self) {
        
        DNA_bases = @"ATGC";
        
        // 10 для начала - так легче дебагить, для FINAL не забыть поменять на 100
        DNA = [[NSMutableArray alloc] initWithCapacity:10];
        
/*            NSLog (@"Конструктор инициирует ДНК: %li", [DNA count ]); //debug
        
        for (int iii=0; iii < 5; iii++) {
            NSLog (@"%i", iii);
        }*/
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // почему цикл не крутится никак не пойму - ага [DNA count] виноват, он же 0!
        for (i=0; i<10; i++) {
            j=(random()%4);
            [DNA addObject:[NSString stringWithFormat:@"%c",[DNA_bases characterAtIndex:j ]]];
//            NSLog (@"Конструктор заполняет ДНК: %li", [DNA count ]); //debug
        }
    }
    else {
       NSLog (@"self почему-то не вернулся");
        }

    return self;
}


- (int) hammingDistance: (Cell*) cell {

    return 0;
}


- (void) print {
    NSLog (@"%@", DNA_bases);
    NSLog (@"%@%@%@", [DNA objectAtIndex:0],[DNA objectAtIndex:5],[DNA objectAtIndex:9]); //[DNA count ]
}

@end
