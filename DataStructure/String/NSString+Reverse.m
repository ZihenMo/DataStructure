//
//  NSString+Reverse.m
//  DataStructure
//
//  Created by gshopper on 2020/12/11.
//  Copyright © 2020 Hutter. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

/// 前后交换
- (NSString *)reverse {
    NSMutableString *result = [self mutableCopy];
    for (NSInteger i = 0, j = self.length - 1; i < j; ++i, --j) {
        NSRange prefixRange = NSMakeRange(i, 1);
        NSRange suffixRange = NSMakeRange(j, 1);
        NSString *prefix = [result substringWithRange:prefixRange];
        NSString *suffix = [result substringWithRange:suffixRange];
        [result replaceCharactersInRange:prefixRange withString:suffix];
        [result replaceCharactersInRange:suffixRange withString:prefix];
    }
    return result;
}

- (unichar *)reverseCharaters {
    unichar *chars = calloc(self.length, sizeof(unichar));   // unichar 占2个字节
    [self getCharacters:chars];
    for (NSInteger i = 0, j = self.length - 1; i < j; ++i, --j) {
        unichar tmp = chars[i];
        chars[i] = chars[j];
        chars[j] = tmp;
    }
    free(chars);
    return chars;
}

+ (void)printUnicharString:(unichar *const)chars {
    int i = 0;
    unichar c = chars[i];
    while ((c = chars[i++]) != '\0') {
        printf("%C", c);
    }
}
@end
