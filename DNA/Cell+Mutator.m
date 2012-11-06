#import "Cell+Mutator.h"


// получаем букву ДНК, возвращаем случайную другую букву ДНК
static const NSString* mutateDNAItem(NSString *item)
{
    int index = arc4random()%kMaxDNAItems;
    
    if(DNAItems[index] == item)
    {
        index = (index + 1 + arc4random()%(kMaxDNAItems - 1))%kMaxDNAItems;
    }
    
    return DNAItems[index];
}

// меняем местами элементы с индексами i и j в массиве arr
static inline void swapArrayItems(unsigned *arr, unsigned i, unsigned j)
{
    arr[i] ^= arr[j]; arr[j] ^= arr[i]; arr[i] ^= arr[j];
}

@implementation Cell (Mutator)

- (void) mutate: (int) percentage
{
    // программа падает, если аргумент assert равен false
    assert((percentage >= 0) && (percentage <= 100));
    
    // если процент мутации 0 - ничего не делаем
    if(percentage == 0) return;
    
    // создаем массив индексов хранящий значения от 0 до (kDNALength - 1)
    unsigned indices[kDNALength];
    for(unsigned i = 0; i < kDNALength; i++)
    {
        indices[i] = i;
    }
    
    // перемешиваем индексы
    for(unsigned i = 0; i < kDNALength - 1; i++)
    {
        swapArrayItems(indices, i, arc4random()%(kDNALength - i - 1) + i + 1);
    }
    
    unsigned mutationLength = (unsigned)roundf((float)kDNALength/100.0f*percentage);
    
    // мутируем все элементы по первым mutationLength индексам лежащим в indices
    for(unsigned i = 0; i < mutationLength; i++)
    {
        [dna replaceObjectAtIndex: indices[i] withObject: mutateDNAItem([dna objectAtIndex: indices[i]])];
    }
}

@end