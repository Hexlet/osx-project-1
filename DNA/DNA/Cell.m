//
//  Cell.m
//  DNA


#import "Cell.h"

#define CAPACITY  100

@implementation Cell

@synthesize dna;

- (id) init
{
    self = [super init];
    
    if ([super init])
    {
        [self fillDNA:CAPACITY];
    }
    
    return self;
}

- (id) initWithCount: (int)capacity
{
    if ([super init])
    {
        [self fillDNA:capacity];
    }
    
    return self;
}

- (void) fillDNA: (int)capacity
{
     int tmp;
        self.dna =  [NSMutableArray arrayWithCapacity:capacity];
        _elements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        for (int index = 0; index < capacity; index++)
        {
            tmp = arc4random() % [_elements count];
            [self.dna addObject: [_elements objectAtIndex:tmp]];
        }

};

- (int) hammingDistance:(Cell *)target {
    //определяем меньшую длинну и записываем ее в переменную
    int checkCount = ([self.dna count] > [target.dna count]) ? (int)[target.dna count] : (int)[self.dna count];
    //если количество элементов разное, присваиваем возвращаемому значению эту разницу
    int dist = (int)ABS([self.dna count] - [target.dna count]);
   
    //перебрав всю цепочку считаем несоответствия
    for (int i = 0; i < checkCount; i++)
    {
          if (![[self.dna objectAtIndex:i] isEqual:[target.dna objectAtIndex:i]])
          {
               dist++;
          }

    }
    return dist;
}


@end
