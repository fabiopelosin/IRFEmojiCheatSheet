//
//  IRFEmojiCheatSheetTests.m
//  IRFEmojiCheatSheetTests
//
//  Created by Fabio Pelosin on 08/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IRFEmojiCheatSheet.h"

@interface IRFEmojiCheatSheetTests : XCTestCase

@end

@implementation IRFEmojiCheatSheetTests

- (void)testGroups
{
    NSArray *groups = [IRFEmojiCheatSheet groups];
    XCTAssertEqualObjects(groups[0], @"People", @"Groups Error");
}

- (void)testEmojisByGroups
{
    NSDictionary *emojisByGroup = [IRFEmojiCheatSheet emojisByGroup];
    XCTAssertEqualObjects(emojisByGroup[@"People"][0], @"smile", @"Emojy by groups error");
}

- (void)testMissingSupportedEmojis
{
    NSDictionary *emojisByGroup = [IRFEmojiCheatSheet emojisByGroup];
    [emojisByGroup enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *aliases, BOOL *stop) {
        [aliases enumerateObjectsUsingBlock:^(NSString *alias, NSUInteger idx, BOOL *stop) {
            NSString *emoji = [IRFEmojiCheatSheet emojisByAlias][alias];
            XCTAssertNotNil(emoji, @"Unsupported alias %@ detected", alias);
        }];
    }];
}

//- (void)testAllAliasesHaveAGroup
//{
//    NSArray *aliases = [[IRFEmojiCheatSheet emojisByAlias] allKeys];
//    NSArray *aliasesFromGrousp = [[[IRFEmojiCheatSheet emojisByGroup] allValues] valueForKeyPath: @"@unionOfArrays.self"];
//    [aliases enumerateObjectsUsingBlock:^(NSString *alias, NSUInteger idx, BOOL *stop) {
//        BOOL found = [aliasesFromGrousp indexOfObject:alias] != NSNotFound;
//        XCTAssertTrue(found, @"Uncategorized alias: %@", alias);
//    }];
//}

- (void)testEmojisByAlias
{
    NSDictionary *emojisByAlias = [IRFEmojiCheatSheet emojisByAlias];
    XCTAssertEqualObjects(emojisByAlias[@"+1"], @"👍", @"Emojy alias error");
}

- (void)testAliasReplacement
{
    NSString *result = [IRFEmojiCheatSheet stringByReplacingEmojiAliasesInString:@":smile: :+1:"];
    XCTAssertEqualObjects(result, @"😄 👍", @"Emojy alias replacement error");
}


@end
