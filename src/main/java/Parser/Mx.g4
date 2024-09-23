grammar Mx;

// ----------------------------------------PARSER----------------------------------------

program: (functionDef | (classDef ';') | (varDef ';'))* EOF;

baseTypeName: Bool | Int | String;
typeName: baseTypeName | Identifier;
type: typeName (LeftBracket ']')*;
varDef:
	type Identifier ('=' expression)? (
		',' Identifier ('=' expression)?
	)*;
returnType: type | Void;

functionDef:
	returnType Identifier '(' (
		type Identifier (',' type Identifier)*
	)? ')' suite;

constructorDef: Identifier '(' ')' suite;
classDef:
	Class Identifier '{' (
		(varDef ';')
		| functionDef
		| constructorDef
	)* '}';

suite: '{' statement* '}';

statement:
	suite			# suiteStmt
	| varDef ';'	# varDefStmt
	| If '(' expression ')' thenStmt = statement (
		Else elseStmt = statement
	)?																								# ifStmt
	| While '(' expression ')' statement															# whileStmt
	| For '(' initStmt = statement condExpr = expression? ';' stepExpr = expression? ')' statement	#
		forStmt
	| Return expression? ';'	# returnStmt
	| Break ';'					# breakStmt
	| Continue ';'				# continueStmt
	| expression ';'			# exprStmt
	| ';'						# emptyStmt;

expression:
	'(' expression ')'									    # parenthesesExpr
	| New typeName (LeftBracket expression? RightBracket)+ arrayLiteral?	    # newArrayExpr
	| New typeName ('(' ')')?								# newVariableExpr
	| function_name = expression '(' (
		expression (',' expression)*
	)? ')'																			# funcCallExpr
	| expression '[' expression ']'													# arrayExpr
	| expression '.' variable = Identifier											# memberAccessExpr // member or function
	| expression op = ('++' | '--')													# postfixUpdateExpr
	| (op = '++' | op = '--') expression											# prefixUpdateExpr
	| op = ('!' | '-' | '~' | '+') r = expression									# unaryExpr
	| l = expression op = ('*' | '/' | '%') r = expression							# binaryExpr
	| l = expression op = ('+' | '-') r = expression								# binaryExpr
	| l = expression op = ('<<' | '>>') r = expression								# binaryExpr
	| l = expression op = ('<' | '>' | '<=' | '>=' | '==' | '!=') r = expression	# binaryExpr
	| l = expression op = '&' r = expression										# binaryExpr
	| l = expression op = '|' r = expression										# binaryExpr
	| l = expression op = '^' r = expression										# binaryExpr
	| l = expression op = '&&' r = expression										# binaryExpr
	| l = expression op = '||' r = expression										# binaryExpr
	| <assoc = right> expression '?' expression ':' expression						# conditionalExpr
	| <assoc = right> l = expression '=' r = expression								# assignExpr
	| primary																		# atomExpr;

primary: fstring | Identifier | literal | This;

fstring:
	Fstring
	| FStringFront expression (FStringMid expression)* FStringBack;

arrayLiteral: '{' ((literal ',')* literal)? '}';

literal:
	True
	| False
	| IntegerLiteral
	| StringLiteral
	| Null
	| arrayLiteral;

// ----------------------------------------LEXER----------------------------------------

// Comments
LineComment: '//' ~[\r\n\u2028\u2029]* -> channel(HIDDEN);
BlockComment: '/*' .*? '*/' -> channel(HIDDEN);

// Whitespace
Whitespace: (' ' | '\t' | '\u000B' | '\u000C' | '\u00A0') -> channel(HIDDEN);
NewLine: ('\r' | '\n' | '\u2028' | '\u2029') -> channel(HIDDEN);

// Keywords
Void: 'void';
Bool: 'bool';
Int: 'int';
String: 'string';
New: 'new';
Class: 'class';
Null: 'null';
True: 'true';
False: 'false';
This: 'this';
If: 'if';
Else: 'else';
For: 'for';
While: 'while';
Break: 'break';
Continue: 'continue';
Return: 'return';

// Identifier
Identifier: [a-zA-Z] [a-zA-Z0-9_]*;

LeftBracket: '[';
RightBracket: ']';

// fragments
fragment EscapeCharacter: 'n' | '\\' | '"';
fragment StringCharacter:
	~["\\\n\r\u2028\u2029]
	| '\\' EscapeCharacter;

// Literals
IntegerLiteral: ('0' | [1-9] [0-9]*);
StringLiteral: '"' StringCharacter* '"';

// fstring module, from leo wang
fragment FStringChar: ('\\' EscapeCharacter)
	| '$$'
	| [\u0020-\u0021\u0023\u0025-\u005B\u005D-\u007E];

Fstring: 'f' '"' FStringChar* '"';
FStringFront: 'f' '"' FStringChar* '$';
FStringMid: '$' FStringChar* '$';
FStringBack: '$' FStringChar* '"';