//
//  Cell.m
//  DNA



#import "Cell.h"

#define CAPACITY  100

@implementation Cell
{
}

- (id) init
{
    self = [super init];
    
    
    if (self)
    {
        int tmp;
        _dna =  [NSMutableArray arrayWithCapacity:CAPACITY];
        _count = CAPACITY;
        _elements = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];

        for (int index = 0; index < _count; index++)
        {
            tmp = arc4random() % [_elements count];
            [_dna addObject: [_elements objectAtIndex:tmp]];
        }
    }

    return self;
}

- (id) initWithCount: (int) capacity
{
    self = [super init];
    
    if (self)
    {
        int tmp;
        _dna =  [NSMutableArray arrayWithCapacity:capacity];
        _count = capacity;
        _elements = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        for (int index = 0; index < _count; index++)
        {
            tmp = arc4random() % [_elements count];
            [_dna addObject: [_elements objectAtIndex:tmp]];
        }
    }
    
    return self;
}

- (NSArray *) getDna
{
    return _dna;
}


- (int) getCount
{
    return _count;
}

- (int) hammingDistance:(Cell *)target {
    //определяем меньшую длинну и записываем ее в переменную
    int checkCount = _count > [target getCount] ? [target getCount] : _count;
    //если количество элементов разное, присваиваем возвращаемому значению эту разницу
    int dist = ABS(_count - [target getCount]);
   
    //перебрав всю цепочку считаем несоответствия
    for (int i = 0; i < checkCount; i++)
    {
          if (![[_dna objectAtIndex:i] isEqual:[[target getDna] objectAtIndex:i]])
          {
               dist++;
          }

    }
    return dist;
}


@end
