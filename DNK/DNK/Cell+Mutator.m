//
//  Cell+Mutator.m
//  DNK
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 Rustam. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
- (void)mutate:(int)prc{
    char arr[100];
    int t=0;
    int y=0;
    
    prc++;
    while (t<prc) {
        y= arc4random()%100;
        if(arr[y]!=1){
          [[self DNA] replaceObjectAtIndex:y withObject:[Cell getRndCellElement]];
            arr[y]=1;
            t++;
        }
    }
    NSLog(@"%i cells is mutate",prc);
   /* //Устанавливаем для всех от обратного
    while (t<prc) {
        y= arc4random()%100;
        if(arr[y]!=1){
            arr[y]=1;
            t++;
        }
    }
    y=0;
    for (NSString __strong *elem in [self DNA]) {
        if (arr[y]!=1) {
         elem = [Cell getRndCellElement];    
        }

        y++;
    }*/
    
}
@end
