//
//  Cell.m
//  DNK
//
//  Copyright (c) 2012 alex. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
}
-(id)init{                     //задание 4 метод init и 100 символов в случайном порядке
    self = [super init];
    if (self){
        NSArray *marray = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 1; i < 101; i++){
        int r = random() % 4;
            NSLog(@"%@", [marray objectAtIndex: r]);
    }
}
    return self;
}
-(void)DNA: (int)d {                                       // задание 3 массив из 100 символов
    NSMutableArray *marray = [[NSMutableArray alloc] init];
    for (int i = 1 ; i < 101; i++) {
        [marray addObject:[NSString stringWithFormat:@"DNA #%d", i]];
    }
    NSLog(@"%@", marray);

}
@end
