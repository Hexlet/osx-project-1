#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char **argv)
{
    @autoreleasepool{
        srand(time(0));
        NSString *format = @"\nhamming distance = %i\ncell 1: %@\ncell 2: %@";
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(format, [cell1 hammingDistance:cell2], cell1, cell2);
        
        [cell1 mutate:rand()%20+10];
        [cell2 mutate:rand()%40+10];
        NSLog(format, [cell1 hammingDistance:cell2], cell1, cell2);
    }
    
    return 0;
}
