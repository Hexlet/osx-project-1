#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell(Mutator)

-(void) mutate:(int)percent;

@end


@implementation Cell(Mutator)

-(void) mutate:(int)percent {
    // Если хотят мутировать на более чем сто процентов, то ничего с ДНК не делаем
    if (percent > 100 || percent < 1) {
        [NSException raise:@"Invalid percent value" format:@"percent of %d is invalid", percent];
        return;
    }
    NSLog(@"Mutating for %i percents", percent);
    // В нашем конкретном случае можно было бы и не вычислять проценты, у нас
    // как раз 100 элементов.
    int count = [self.DNA count] / 100 * percent;
    
    // Массив с индексами измененных элементов ДНК
    NSMutableArray *changed;
    changed = [[NSMutableArray alloc] init];
    for (int i = 0; i <= count; i++) {
        int position = arc4random() % [self.DNA count];
        while ([changed containsObject:[NSNumber numberWithInt:position]]) {
            NSLog(@"Nucleotide at index %i has mutated. Trying get another index.", position);
            position = arc4random() % [self.DNA count];
        }
        
        // Заменяем нуклеотид
        int nucleotide_position = arc4random() % [self.nucleotides length];
        NSString *nucleotide = [NSString stringWithFormat:@"%C", [self.nucleotides characterAtIndex:nucleotide_position]];
        while ([self.DNA[position] isEqualTo:nucleotide]) {
            nucleotide_position = arc4random() % [self.nucleotides length];
            nucleotide = [NSString stringWithFormat:@"%C", [self.nucleotides characterAtIndex:nucleotide_position]];
        }
        
        [self.DNA replaceObjectAtIndex:position withObject:nucleotide];
        [changed addObject:[NSNumber numberWithInt:position]];
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Distance before mutation: %i", [cell hammingDistance:cell2]);
        
        [cell mutate:13];
        [cell2 mutate:23];
        NSLog(@"Distance after mutation: %i", [cell hammingDistance:cell2]);

        
    }
    return 0;
}

