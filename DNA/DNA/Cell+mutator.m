//
//  Cell+mutator.m
//  DNA


#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate: (int) x
{
    if (x < 0 || x > 100)
    {
        NSLog(@"Error - incorrect percentage");
        return;
    }
    
    if (x == 0) return;
    
    //вычисляем количество символов для замены
    int changeCount = ([self.dna count] * x) / 100;
    BOOL changed;
    NSMutableSet *alreadyChanged = [[NSMutableSet alloc] init];
    for (int i = 0; i < changeCount; i++)
    {
        changed = NO;
        do {
            int index = arc4random() % [self.dna count];
            
            if (![alreadyChanged containsObject:[NSNumber numberWithInt:index]])
            {
                NSString *newElement = [_elements objectAtIndex:arc4random()%[_elements count]];
                
                //перебираем пока не найдем чем заменить, если нашли с 1 раза, то в цикл не попадаем
                while ([[self.dna objectAtIndex:index] isEqual:newElement]) {
                    newElement = [_elements objectAtIndex:arc4random()%[_elements count]];
                }
              
                [self.dna replaceObjectAtIndex:index withObject:newElement];
                
                [alreadyChanged addObject:[NSNumber numberWithInt:index]];
                changed = YES;
            }
        } while (!changed);
        
    }
}
    


@end
