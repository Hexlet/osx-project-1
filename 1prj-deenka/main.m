//
//  main.m
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// Категория МУТАТОР ***************
// (вынести в отдельные .h & .m? )
@interface Cell (mutator)

- (void) mutator: (int) percent;

@end

@implementation Cell (mutator)
    
- (void) mutator: (int) percent {
    NSLog(@"%@",self->DNA);
}
@end
// End of МУТАТОР ******************

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //create 2 elements
        Cell *leeloo, *korben;
        leeloo = [[Cell alloc] init];
        korben = [[Cell alloc] init];

        
        NSLog(@"Hamming Distance = %i",[leeloo hammingDistance:korben]);
        
        [leeloo print];
        [korben mutator:1];
/*        for (int i=0; i<100; i++) {
         NSLog(@"%li",random()%5 );
         }
*/
 }
    
    // ToDo: не забыть помыть мутатор
    return 0;
}

