// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=POUND_EXPR_1 | %FileCheck %s -check-prefix=POUND_EXPR_INTCONTEXT
// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=POUND_EXPR_2 | %FileCheck %s -check-prefix=POUND_EXPR_STRINGCONTEXT
// RUN: %target-swift-ide-test -code-completion -source-filename %s -code-completion-token=POUND_EXPR_3 | %FileCheck %s -check-prefix=POUND_EXPR_SELECTORCONTEXT
// REQUIRES: objc_interop

import ObjectiveC

func useInt(_ str: Int) -> Bool {}
func useString(_ str: String) -> Bool {}
func useSelector(_ sel: Selector) -> Bool {}

func test1() {
  let _ = useInt(##^POUND_EXPR_1^#)
  let _ = useString(##^POUND_EXPR_2^#)
  let _ = useSelector(##^POUND_EXPR_3^#)
}

// POUND_EXPR_INTCONTEXT: Begin completions, 8 items
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#function]/None:            function[#String#]; name=function
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#file]/None:                file[#String#]; name=file
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#fileID]/None: fileID[#String#]; name=fileID
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#filePath]/None: filePath[#String#]; name=filePath
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#line]/None/TypeRelation[Convertible]: line[#Int#]; name=line
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#column]/None/TypeRelation[Convertible]: column[#Int#]; name=column
// POUND_EXPR_INTCONTEXT-DAG: Keyword[#dsohandle]/None:           dsohandle[#UnsafeRawPointer#]; name=dsohandle
// POUND_EXPR_INTCONTEXT-DAG: Decl[Macro]/OtherModule[Swift]/IsSystem: externalMacro({#module: String#}, {#type: String#})[#T#]; name=externalMacro(module:type:)
// POUND_EXPR_INTCONTEXT: End completions

// POUND_EXPR_STRINGCONTEXT: Begin completions, 9 items
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#function]/None/TypeRelation[Convertible]: function[#String#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#file]/None/TypeRelation[Convertible]: file[#String#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#fileID]/None/TypeRelation[Convertible]: fileID[#String#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#filePath]/None/TypeRelation[Convertible]: filePath[#String#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#line]/None:                line[#Int#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#column]/None:              column[#Int#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword[#dsohandle]/None:           dsohandle[#UnsafeRawPointer#];
// POUND_EXPR_STRINGCONTEXT-DAG: Keyword/None/TypeRelation[Convertible]: keyPath({#@objc property sequence#})[#String#];
// POUND_EXPR_STRINGCONTEXT-DAG: Decl[Macro]/OtherModule[Swift]/IsSystem: externalMacro({#module: String#}, {#type: String#})[#T#]; name=externalMacro(module:type:)
// POUND_EXPR_STRINGCONTEXT: End completions

// POUND_EXPR_SELECTORCONTEXT: Begin completions, 9 items
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#function]/None/TypeRelation[Convertible]: function[#Selector#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#file]/None/TypeRelation[Convertible]: file[#Selector#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#fileID]/None/TypeRelation[Convertible]: fileID[#Selector#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#filePath]/None/TypeRelation[Convertible]: filePath[#Selector#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#line]/None:                line[#Int#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#column]/None:              column[#Int#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword[#dsohandle]/None:           dsohandle[#UnsafeRawPointer#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Keyword/None/TypeRelation[Convertible]: selector({#@objc method#})[#Selector#];
// POUND_EXPR_SELECTORCONTEXT-DAG: Decl[Macro]/OtherModule[Swift]/IsSystem: externalMacro({#module: String#}, {#type: String#})[#T#]; name=externalMacro(module:type:)
// POUND_EXPR_SELECTORCONTEXT: End completions
