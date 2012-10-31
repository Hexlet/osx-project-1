#import "Cell.h"


const NSString *DNAItems[kMaxDNAItems] = {@"A", @"T", @"G", @"C"};

@implementation Cell

// синтезируем геттер
@synthesize dna;

- (id) init
{
    if(self = [super init])
    {
        // создадим массив
        dna = [[NSMutableArray alloc] initWithCapacity: kDNALength];
        
        // заполним массив элементами из DNAItems в случайном порядке
        for(int i = 0; i < kDNALength; i++)
        {
            [dna addObject: DNAItems[arc4random()%kMaxDNAItems]];
        }
    }
    
    return self;
}

+ (id) cell
{
    return [[[self alloc] init] autorelease];
}

- (void) dealloc
{
    [dna release];
    
    [super dealloc];
}

// для того, чтобы NSLog(@"%@") печатал в лог все элементы dna в строку
- (NSString *) description
{
    return [dna componentsJoinedByString: @""];
}

- (unsigned) hammingDistance: (Cell *) cell
{
    unsigned dist = 0;
    
    for(int i = 0; i < kDNALength; i++)
    {
        // валидное сравнение для immutable объектов
        if([dna objectAtIndex: i] != [cell.dna objectAtIndex: i])
        {
            dist++;
        }
    }
    
    return dist;
}

@end