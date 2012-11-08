#import "Cell.h"
#import "mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)x_percent {
    int DNA_length = self.DNA_length;
    int mutable_elements = (int)(DNA_length*x_percent/100); // вычисляем количество изменяемых елементов
    //NSLog(@"elem->%i",mutable_elements);
    NSMutableArray *mutableElementsArray = [[NSMutableArray alloc] init]; // массив позиций DNA для изменения
    for (int i = 0; i < mutable_elements; i++){
        [mutableElementsArray addObject:[NSString stringWithFormat:@"%i", -1]];   // заполняем промежуточными значениями
    }
    //NSLog(@"000mutelemarr->%@",mutableElementsArray);
    for (int i = 0; i < mutable_elements;){
        int elem = arc4random()%DNA_length;   // находим случайный елемент для изменения
        int count = 0;
        for (int j = 0 ; j < mutable_elements; j++){
            if (mutableElementsArray[j] != [NSString stringWithFormat:@"%i", elem]){ // проверяем не обрабатывался ли ранее
                count++;
            }
        }
        if (count == mutable_elements){
            mutableElementsArray[i] = [NSString stringWithFormat:@"%i", elem]; // если нет пишем его в массив позиций
            //NSLog(@"count->%i",count);
        }else{
            continue; //если да берем другой случайный елемент
        }
        i++;
    }
    //NSLog(@"mutelemarr->%@",mutableElementsArray);
    
    // Мутируем выбраные елементы
    NSArray *variant = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    for (int i = 0; i < mutable_elements;){
        int position = [[NSString stringWithFormat:@"%@", mutableElementsArray[i]] intValue]; // елемент с номером position
        int elem = arc4random()%4;  // вычисляем новое случайное значение
        if (self.DNA[position] != variant[elem]){  // если новое значение не совпадает со старым
            self.DNA[position] = [NSString stringWithFormat:@"%@",variant[elem]]; // записываем его в DNA
            i++;
        } 
    }
}

@end