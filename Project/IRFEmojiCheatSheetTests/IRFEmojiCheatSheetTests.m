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
    NSDictionary *emojisByGroups = [IRFEmojiCheatSheet emojisByGroups];
    XCTAssertEqualObjects(emojisByGroups[@"People"][0], @"bowtie", @"Emojy by groups error");
}

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
