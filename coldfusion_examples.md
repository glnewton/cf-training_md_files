# Adobe ColdFusion 2023 Coding Examples

This document compiles various ColdFusion examples demonstrating core concepts, syntax, and best practices in Adobe ColdFusion 2023.

## Table of Contents

1. [Introduction to ColdFusion](#introduction-to-coldfusion)
2. [Variables and Data Types](#variables-and-data-types)
3. [Main ColdFusion Constructs](#main-coldfusion-constructs)
4. [Functions](#functions)
5. [Scopes](#scopes)

---

## Introduction to ColdFusion

### What is ColdFusion?

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>What is ColdFusion?</title>
</head>
<body>
	<cfif isDefined('form.name')>
		<cfoutput>
			<p>Dear #form.name#,<p>
			<p>Welcome to the Adobe ColdFusion Specialist Certification Program.</p>
		</cfoutput>
	<cfelse>
		<form method="POST">
			<div>
				<label for="name">Your Name</label>
				<input name="name" id="name" type="text" />
			</div>
			<div>
				<button type="submit">Send</button>
			</div>
		</form>
	</cfif>
</body>
</html>
```

### Using `cfoutput`

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Printing data with cfoutput</title>
</head>
<body>
	<h1>Printing data on the screen</h1>
	
	<cfset fName = "Damien" />

	<p>The value of the fName variable is #fName#.</p>

</body>
</html>
```

### Tag vs Script Syntax

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The tag and the script syntax</title>
</head>
<body>
	<h1>The tag and the script syntax</h1>
	
	<cfset fName = "Damien" />
	<cfoutput>
		<p>The value of the fName variable is #fName#.</p>
	</cfoutput>

</body>
</html>
```

### Commenting in Tag Syntax

```cfm
<!---
	index.cfm

	This is the index file for the company website.

	Written by Nolan, May 2019
--->
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>

	<!-- Users listing -->
	<h2>Users</h2>

	<cfset aryUsers = [ "John", "Paul", "George", "Ringo" ] />
	<cfloop array="#aryUsers#" index="curUser">
		<cfoutput>
			<div>#curUser#</div>
		</cfoutput>
	</cfloop>

	<!-- Employees listing -->
	<h2>Employees</h2>
	<cfscript>
		aryEmployees = [ "Mick", "Keith", "Charlie", "Ron", "Brian" ];	// this is our list of new employees
		/*
		for( e in aryEmployees )
		{
			WriteOutput( "<div>#e#</div>" );
		}
		*/
	</cfscript>
</body>
</html>
```

### Using `cfdump` and `writeDump()`

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>&lt;cfdump&gt; and writeDump()</title>
</head>
<body>
	<h1>Using &lt;cfdump&gt; and writeDump()</h1>
	
	<p>
	<!--- Dumping a string --->
		<cfset fName = "Damien" />
		<cfdump var="#fName#" />
	<br />
	<!--- Dumping a number --->
		<!--- <cfset age = 43 />
		<cfdump var="#age#" /> --->
	<br />
	<!--- Dumping a boolean --->
		<!--- <cfset hasGlasses = true />
		<cfdump var="#hasGlasses#" /> --->
	<br />
	<!--- Dumping an array --->
		<!--- <cfset beatles = ["John", "Paul", "George", "Ringo"] />
		<cfdump var="#beatles#" label="Dumping an Array"/> --->
	<br />
	<!--- Dumping a structure --->
		<!--- <cfset student =  { name = "Alvin", age = 22,hairColor = "brown" } />
		<cfdump var="#student#" label="Dumping a structure" /> --->
	
	</p>
	
	<p>
	<!--- <cfscript>
		// dumping a string
		fName = 'Damien';
		writeDump(fname);
		writeOutput('<br />');
		
		
		//dumping a number
		age = 43;
		writeDump(age);
		writeOutput('<br />');
		
		//dumping a boolean
		hasGlasses = true;
		writeDump(hasGlasses);
		writeOutput('<br />');
		
		//dumping an array
		beatles = ["John", "Paul", "George", "Ringo"];
		writeDump(var=beatles, label="Dumping an Array");
		writeOutput('<br />');
		
		//dumping a structure
		student = { name = "Alvin", age = 22,hairColor = "brown" };
		writeDump(var=student, label="Dumping a structure");
		writeOutput('<br />');
	</cfscript> --->
	</p>
	
</body>
</html>
```

---

## Variables and Data Types

### Creating Variables

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Creating Variables</title>
</head>
<body>
	<cfset myVariable = "ColdFusion" />

	<cfoutput>
		<p>The value of my variable is #myVariable#.</p>
	</cfoutput>
	
</body>
</html>
```

### Weakly Typed Language

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>CFML is weakly typed</title>
</head>
<body>
    <h1>CFML is weakly typed</h1>
	<cfset myVariable = "ColdFusion" />

	<cfoutput>
		<p>The value of my variable is #myVariable#. It is a string variable.</p>
    </cfoutput>
	
</body>
</html>
```

### Creating Lists

```cfm
<cfscript>
	// basic "string" variables
	person1 = "John";
	person2 = "Paul";
	person3 = "George";
	person4 = "Ringo";

	// also a string variable, but with data separated by commas
	people = "John,Paul,George,Ringo";

	WriteOutput( "<p>The list of people:</p>" );
	WriteOutput( "<p>#people#</p>" );

	// a list containing numbers, but wrapped in quotation marks to make it a "string"
	testScores = "99,84,101";

	WriteOutput( "<p>The list of test scores:</p>" );
	WriteOutput( "<p>#testScores#</p>" );

	// a list containing both numbers and text
	namesAndAges = "David,71,Tony,68,Woody,67,Mick,54";

	WriteOutput( "<p>The list of names and ages:</p>" );
	WriteOutput( "<p>#namesAndAges#</p>" );
</cfscript>
```

### List Delimiters

```cfm
<cfscript>
	// also a string variable, but with data separated by commas
	people = "John,Paul,George,Ringo";

	WriteOutput( "<p>The list of people:</p>" );
	WriteOutput( "<p>#people#</p>" );

	// newList = listChangeDelims( people, "$" );

	// WriteOutput( "<p>The new list of people:</p>" );
	// WriteOutput( "<p>#newList#</p>" );

	// WriteOutput( "<p>The list contains #ListLen( newList )# items.</p>" );
	// WriteOutput( "<p>The list contains #ListLen( newList, "$" )# items.</p>" );
</cfscript>
```

### Empty List Items

```cfm
<cfscript>
	people = "Mick,,,,Keith,,,,Charlie,Ronnie,,,,,Bill";

	numItems = ListLen( people );
	// numItems = ListLen( people, ",", true );

	WriteOutput( "<p>The list contains #numItems# items.</p>" );

	// WriteOutput( "<p>The first item is: #ListFirst( people )#</p>" );
	// WriteOutput( "<p>The second item is: #ListGetAt( people, 2, ",", true )#</p>" );
</cfscript>
```

### Finding Items in Lists

```cfm
<cfscript>
	studentNames = "Chino Moreno,Stephen Carpenter,Abe Cunningham,Frank Delgado,Sergio Vega";

	foundIdx = ListFind( studentNames, "Steph" );
	// foundIdx = ListContains( studentNames, "Steph" );
	// foundIdx = ListFindNoCase( studentNames, "STephen Carpenter" );
	// foundIdx = ListContainsNoCase( studentNames, "stEPH" );
	// foundIdx = studentNames.listFind( "Steph" );
	// foundIdx = studentNames.listContains( "Steph" );
	// foundIdx = studentNames.listFindNoCase( "stEPH" );
	// foundIdx = studentNames.listContainsNoCase( "stEPH" );

	if( foundIdx == 0 )
	{
		WriteOutput( "<p>No matching name found.</p>" );
	}
	else 
	{
		WriteOutput( "<p>That is student number #foundIdx# in the list.</p>" );	
	}
</cfscript>
```

### Basic Arrays

```cfm
<cfscript>
	name1 = "John";
	name2 = "Paul";
	name3 = "George";
	name4 = "Ringo";

	users = ArrayNew( 1 );
	users[ 1 ] = "John";
	users[ 2 ] = "Paul";
	users[ 3 ] = "George";
	users[ 4 ] = "Ringo";
	WriteDump( users );

	// ArrayAppend( users, "Pete" );
	// ArrayAppend( users, "Stuart" );
	// WriteDump( users );

	// users = [ "John", "Paul", "George", "Ringo" ];
	// users.append( "Pete" );
	// users.append( "Stuart" );
	// WriteDump( users );	

	// userData = ArrayNew( 1 );
    // userData[ 1 ] = "James Hetfield";
    // userData[ 2 ] = 48;
    // ArrayAppend( userData, "123 Main Street" );
    // userData.append( Now() );

    // WriteDump( userData );

    // userData = [ "James Hetfield", 48, "123 Main Street", Now() ];
    // WriteDump( userData );
</cfscript>
```

### Empty Array Items

```cfm
<cfscript>
	authors = [ "Stephen King", "", "Chuck Klosterman", "", "David Sedaris", "Nick Hornby", "Judy Blume" ];
	WriteDump( authors );

	// movies = ArrayNew( 1 );
	// movies[ 1 ] = "Pretty In Pink";
	// movies[ 2 ] = "Top Gun";
	// movies[ 3 ] = "Clue";
	// movies[ 4 ] = "Sneakers";
	// movies[ 5 ] = "The Breakfast Club";
	// WriteDump( movies );

	// movies = ArrayNew( 1 );
	// movies.append( "Pretty In Pink" );
	// movies.append( "Top Gun" );
	// movies.append( "Clue" );
	// movies.append( "Sneakers" );
	// movies.append( "The Breakfast Club" );
	// WriteDump( movies );
</cfscript>
```

### Finding in Arrays

```cfm
<cfscript>
	movies = [ "Pretty In Pink", "The Breakfast Club", "Labyrinth", "Clue", "Sneakers", "Top Gun" ];

	WriteOutput( "<p>The first movie in the array is: #ArrayFirst( movies )#</p>" );
	WriteOutput( "<p>The first movie in the array is: #movies.first()#</p>" );

	// WriteOutput( "<p>The last movie in the list is: #ArrayLast( movies )#</p>" );
	// WriteOutput( "<p>The last movie in the list is: #movies.last()#</p>" );
	
	// foundIdx = ArrayFind( movies, "The Breakfast Club" );
	// WriteOutput( "<p>The Breakfast Club is movie number #foundIdx# in the list</p>" );
	
	// WriteOutput( "<p>The Breakfast Club is movie number #movies.find( "The Breakfast Club" )# in the list</p>" );

	studentNames = [ "Chino Moreno", "Stephen Carpenter", "Abe Cunningham", "Frank Delgado", "Sergio Vega" ];

	// foundIdx = ArrayFind( studentNames, "Stephen Carpenter" );
	// foundIdx = ArrayFindNoCase( studentNames, "STePhen Carpenter" );
	// foundIdx = studentNames.find( "Steph" );
	// foundIdx = studentNames.findNoCase( "STephen Carpenter" );

	// if( foundIdx == 0 )
	// {
	// 	WriteOutput( "<p>No matching name found.</p>" );
	// }
	// else 
	// {
	// 	WriteOutput( "<p>That is student number #foundIdx# in the array.</p>" );	
	// }
	
	// isFound = ArrayContains( studentNames, "Stephen Carpenter" );
	// isFound = ArrayContainsNoCase( studentNames, "STephen Carpente" );
	// isFound = studentNames.contains( "Stephen Carpenter" );

	// if( isFound )
	// {
	// 	WriteOutput( "<p>Yes that student is in the array</p>" );
	// }
	// else 
	// {
	// 	WriteOutput( "<p>That student was not found.</p>" );
	// }
</cfscript>
```

### Merging Arrays

```cfm
<cfscript>
	books = [ "Charlie and The Chocolate Factory", "Where The Sidewalk Ends", "James and the Giant Peach" ];
	WriteDump( books );

	movies = [ "Top Gun", "Clue", "Weird Science" ];
	WriteDump( movies );

	// movies.append( books );
	// WriteDump( movies );

	// movies.append( books, true );
	// WriteDump( movies );
</cfscript>
```

### Multi-Dimensional Arrays

```cfm
<cfscript>
	customerInfo = ArrayNew( 2 );

	customerInfo[ 1 ][ 1 ] = "John";
	customerInfo[ 1 ][ 2 ] = "Lennon";
	customerInfo[ 1 ][ 3 ] = "john@vanedlay.biz";

	customerInfo[ 2 ][ 1 ] = "George";
	customerInfo[ 2 ][ 2 ] = "Harrison";
	customerInfo[ 2 ][ 3 ] = "george@vanedlay.biz";

	WriteDump( customerInfo );

	WriteOutput( "<p>George's email address is #customerInfo[ 2 ][ 3 ]#</p>" );
</cfscript>
```

### Array Functions

```cfm
<cfscript>
    aBands = ['Beatles', 'Rolling Stones', 'Deep Purple', 'AC / DC'];

    // arrayAppend() => Appends an element to the end of an array.
    // ArrayAppend(aBands, 'U2');
    // aBands.append('U2');

    // arrayPrepend() => Inserts an array element at the beginning of an array.
    // arrayPrepend(aBands, 'Genesis');
    // aBands.prepend('Genesis');

    // arrayInsertAt() => Inserts a value at a specified position in an array.
    // arrayInsertAt(aBands, 3, 'Black Sabbath');
    // aBands.insertAt(3, 'Black Sabbath');
    
    // arrayDelete() => Deletes an object from an array.
    // arrayDeleteNoCase() => Deletes an object from an array, case insensitive.
    // arrayDelete(aBands, 'Deep purple');
    // aBands.delete('Deep Purple');

    // arrayDeleteAt() => Deletes an object from an array at a particular index.
    // arrayDeleteAt(aBands, 2);
    // aBands.deleteAt(2);

    // arrayClear() => deletes all elements in an array
    // arrayClear(aBands);
    // aBands.clear();

    writedump(aBands);

    // aNumbers = [5,8,7,3,9,12,47,95];

    // arrayAvg() => Calculates the average of the values in an array
    // result = ArrayAvg(aNumbers);
    // result = aNumbers.avg();

    // arraySum() => Calculates the sum of all the elements in an array.
    // result = ArraySum(aNumbers);
    // result = aNumbers.sum();

    // arrayMax() => Finds the maximum value of the elements in an array.
    // result = ArrayMax(aNumbers);
    // result = aNumbers.max();

    // arrayMin() => Finds the minimum value of the elements in an array.
    // result = ArrayMin(aNumbers);
    // result = aNumbers.min();

    // writedump(result);

    // arrayToList() => Converts a one-dimensional array to a list.
    // lBands = arrayToList(aBands);
    // lBands = aBands.toList();

    // writeDump(lBands);
    
    // listToArray() => Copies the elements of a list to an array.
    // aBandsFromList = listToArray(lbands);
    // aBandsFromList = lBands.listToArray();

    // writeDump(aBandsFromList);
</cfscript>
```

### Creating Structures

```cfm
<cfscript>
	aryBandMembers = [ "John", "Paul", "George", "Ringo" ];
	WriteDump( aryBandMembers );

	structBandMembers = { harmonica: "John",
						  bass: "Paul",
						  guitar: "George",
						  drums: "Ringo"
					    };
	WriteDump( structBandMembers );

	// student1 = { 
	// 		name = "Alvin",
	// 		age = 22,
	// 		hairColor = "brown"
	// 	};

	// WriteDump( student1 );
	
	// student2 = StructNew();
	// student2.name = "Simon";
	// student2.age = 25;
	// student2.hairColor = "black";

	// WriteDump( student2 );
</cfscript>
<!--- <cfset student3 = { name = "Theodore",
					age = 27,
					hairColor = "green"
} />
<cfdump var="#student3#" /> --->

<!--- <cfset student4 = StructNew() />
<cfset student4.name = "Dave" />
<cfset student4.age = 42 />
<cfset student4.hairColor = "blonde" />
<cfdump var="#student4#" /> --->
```

### Keys in Structures

```cfm
<cfscript>
	userInfo = {
		name: "Joey",
		age: 26
	};

	WriteDump( userInfo );

	// userInfo.AGE = 55;
	// userINFO.NAME = "Richard";

	// WriteDump( userInfo );

	// authorInfo = {
	// 	authorName: "Stephen King",
	// 	age: 54
	// };

	// WriteDump( authorInfo );

	// authorInfo[ "list of books" ] = "Christine,It,Cujo,Eyes of the Dragon,The Stand";

	// WriteDump( authorInfo );

	// WriteOutput( "<p>Author Name is: #authorInfo.authorName#</p>" );

	// WriteOutput( "<p>Books written include:</p>" );

	// WriteOutput( authorInfo.list of books );

	// WriteOutput( authorInfo[ "list of books" ] );
	// WriteOutput( authorInfo[ "LIST of books" ] ); // case sensitivity doesn't matter
	// WriteOutput( authorInfo[ "LIST of    books" ] ); // matching the spacing does matter
</cfscript>
```

### Finding in Structures

```cfm
<cfscript>
	userInfo = {
		name = "Joey Ramone",
		age  = 25,
		hairColor = "black",
		weight = "200lbs",
		address = "123 Main Street",
		city = "Brooklyn",
		state = "CA",
		postalCode = "11321",
		email = "joey@ramones.biz"
	};

	// userInfo.insert( "height", "5 foot 8" );
	
	if( userInfo.keyExists( "height" ) )
	{
		WriteOutput( "Joey's height is #userInfo.height#" );

		// WriteOutput( "Joey's height is #userinfo.find( 'height' )#" );
	
		// WriteDump( userinfo.findKey( 'state' ) );

		// WriteDump( userInfo.findValue( 'CA' ) );
	}
	else 
	{
		WriteOutput( "We don't have height data for that person." );
	}	

	// if( StructKeyExists( userInfo, "height" ) )
	// {
	// 	WriteOutput( "Joey's height is #userInfo.height#" );
	// 	WriteOutput( "Joey's height is #structFind( userinfo, 'height' )#" );
	
	// 	WriteDump( structFindKey( userinfo, 'state' ) );

	// 	WriteDump( structFindValue( userinfo, 'CA' ) );
	// }
	// else 
	// {
	// 	WriteOutput( "We don't have height data for that person." );
	// }
</cfscript>
```

### Merging and Copying Structures

```cfm
<cfscript>
	companyInfo = {
		name = "Vandelay Industries",
		yearFounded = 1987,
		location = "New York",
		color = "red"
	};

	productInfo = {
		partNumber = "123-ABC",
		color = "green",
		price = "4.99",
		weight = "12 lbs"
	};

	WriteDump( companyInfo );
	WriteDump( productInfo );

	// companyInfo.append( productInfo );

	// WriteDump( companyInfo );
	// WriteDump( productInfo );

	///////////////////
	//Copying structs
	///////////////////

	// customer1 = {
	// 	name = "Blair Sheehan",
	// 	hairColor = "brown",
	// 	eyes = "blue",
	// 	weight = "130 lbs"
	// };

	// WriteDump( customer1 );

	// customer2 = customer1;
	// WriteDump( customer2 );

	// customer2 = customer1.copy();
	// customer2 = StructCopy( customer1 );
	// WriteDump( customer2 );
	
	// customer2.eyes = "green";
	// WriteDump( customer2 );
</cfscript>
```

### Shallow Copy vs Deep Copy

```cfm
<cfscript>
	user1 = {
		name = "Joey Ramone",
		age = 55,
		eyeColor = "brown",
		favoriteBooks = [ "Christine", "It", "High Fidelity", "Looking For Alaska" ],
		addressInfo = {
			address = "123 Main Street",
			city = "Brooklyn", 
			state = 'NY',
			postalCode = "12134"
		}
	};

	user2 = user1.copy();
	// user2 = user1.duplicate();

	WriteDump( user1 );
	WriteDump( user2 );

	// user1.favoriteBooks.append( "The Stand" );

	// WriteDump( user1 );
	// WriteDump( user2 );

	// user1.addressInfo.city = "San Francisco";

	// WriteDump( user1 );
	// WriteDump( user2 );
</cfscript>
```

### Null Support

```cfm
<cfscript>
    someVar = null;

    writeDump(someVar);

    //writeDump(isNull(somevar));
</cfscript>
```

---

## Main ColdFusion Constructs

### If/Else in Script Syntax

```cfm
<cfscript>
    
</cfscript>
```

### Nested If Statements

```cfm
<cfscript>
    age = 4

    if ( age > 20 )
    {
        WriteOutput( "<p>Welcome to the show!</p>" );
    }
    else if ( age < 21 and age > 12 )
    {
        WriteOutput( "<p>You are allowed in the teen center portion of the club.</p>" );
    }
    else if ( age > 1 and age < 6 )
    {
        WriteOutput( "Children under 6 are allowed in free with a parent." );
    }
    else
    {
        WriteOutput( "<p>Sorry, you are not old enough to enter.</p>" );
    }

    WriteOutput( "<p>Thnk you for using our application</p>" );
</cfscript>
```

### Simple If Tag

```cfm
<cfset age = 74 />
```

### Comparison Operators

```cfm
<cfset age = 43 />

<cfif age GT 20>
    <p>Welcome to the show !</p>
<cfelse>
    <p>Sorry, you are not old enough to enter.</p>
</cfif>

<cfscript>
  ageScript = 43;
   
  if(ageScript > 20){
      writeOutput("<p>Welcome to the show !</p>");
  } else {
      writeOutput("<p>Sorry, you are not old enough to enter.</p>");
  }
</cfscript>
```

### Ternary Operator

```cfm
<cfscript>
    age = 43;
     
    //Ternary operator basic syntax : Condition ? Value if true : Value if false

    if(age > 20){
        writeOutput("<p>Welcome to the show !</p>");
    } else {
        writeOutput("<p>Sorry, you are not old enough to enter.</p>");
    }
</cfscript>
```

### Switch Case

```cfm
<cfscript>
	grade = 3;

	if( grade == 1 )
	{
		WriteOutput( "First graders are in room A-5" );
	}
	else if( grade == 2 )
	{
		WriteOutput( "Second graders are in room B-22" );
	}
	else if( grade == 3 )
	{
		WriteOutput( "Third graders are in room 7" );
	}
	else if( grade == 4 )
	{
		WriteOutput( "Fourth graders are in room D-3" );
	}
	else if( grade == 5 )
	{
		WriteOutput( "Fifth graders are in room 98" );
	}
	else if( grade == 6 )
	{
		WriteOutput( "Sixth graders are in room 54" );
	}
	else 
	{
		WriteOutput( "We don't teach that grade at this school." );	
	}
</cfscript>
```

### Break Statement

```cfm
<cfscript>
	grade = 4;

	switch( grade )
	{
		case 1: WriteOutput( "First graders are in room A-5" );
				break;

		case 2: WriteOutput( "Second graders are in room B-22" );
				break;

		case 3: WriteOutput( "Third graders are in room 17." );
				break;

		case 4: WriteOutput( "Fourth graders are in room D-3" );
				break;

		case 5: WriteOutput( "Fifth graders are in room 98" );
				break;

		case 6: WriteOutput( "Sixth graders are in room 54" );
				break;

		default: WriteOutput( "We don't teach that grade at this school." );
				 break;
	}
</cfscript>
```

### If in Switch Case

```cfm
<cfscript>
	firstName = "John";

	switch( firstName )
	{
		case "John":
					WriteOutput( "John plays harmonica" );
					break;

		case "Paul":
					WriteOutput( "Paul plays bass" );
					break;

		case "George":
					WriteOutput( "George plans electric guitar" );
					break;

		case "Ringo":
					WriteOutput( "Ringo plays drums." );
					break;

		default: WriteOutput( "That is not a Beatle." );
				 break;
	}
</cfscript>
```

### For Loop

```cfm
<cfscript>
	for( i = 0; i < 5; i++ )
	{
		WriteOutput( "<p>I is: #i#</p>" );
	}

	// for( i = 5; i > 0; i-- )
	// {
	// 	WriteOutput( "<p>I is: #i#</p>" );
	// }

	// for( i = 0; i < 10; i = i + 2 )
	// {
	// 	WriteOutput( "<p>I is: #i#</p>" );
	// }
</cfscript>
```

### While and Do-While Loops

```cfm
<cfscript>
	i = 10;

	WriteOutput( "<ol>" );

	while( i < 20 )
	{
		WriteOutput( "<li>Hello</li>" );
		i++;
	}
	// do
	// {
	// 	WriteOutput( "<li>Hello</li>" );
	// 	i++;
	// }
	// while( i > 20 );

	WriteOutput( "</ol>" );
</cfscript>
```

### For-In Loop

```cfm
<cfscript>
	aryPunkBands = [ "7 Seconds", "Green Day", "Fugazi", "Descendents", "The Clash" ];

	WriteOutput( "<ol>" );

	// notice we're starting with i = 1 
	// because arrays in CFML are 1-based, not 0-based
	for( i = 1; i <= aryPunkBands.len(); i++ )
	{
		WriteOutput( "<li>#aryPunkBands[ i ]#</li>" );
	}

	// for( p in aryPunkBands )
	// {
	// 	WriteOutput( "<li>#p#</li>" );
	// }

	WriteOutput( "</ol>" );
</cfscript>
```

### Looping Over Lists

```cfm
<cfscript>
	students = "Steph,Chino,Abe,Sergio,Frank,Chi";

	for( i = 1; i lte ListLen( students ); i++ )
	{
		WriteOutput( "<div>#ListGetAt( students, i )#</div>" );
	}

	// for( i in students )
	// {
	// 	WriteOutput( "<div>#i#</div>" );
	// }
</cfscript>

<cfoutput>
	<!--- <cfloop from="1" to="#ListLen( students )#" index="i">
		<div>#ListGetAt( students, i )#</div>
	</cfloop> --->

	<!--- <cfloop list="#students#" index="i">
		<div>#i#</div>
	</cfloop> --->
</cfoutput>

<cfscript>
	students = "Steph,Chino,Abe,Sergio,Frank,Chi";

	students.listEach( function( element, index, list ) {
		writeOutput( "<div>#index#:#element#</div>" );
	});

	// WriteOutput( element );
	// WriteOutput( index );
	// WriteOutput( list );
</cfscript>
```

### Looping Over Arrays

```cfm
<cfscript>
	students = [ "Steph", "Chino", "Abe", "Sergio" ,"Frank", "Chi" ];

	for( i = 1; i lte ArrayLen( students ); i++ )
	{
		WriteOutput( "<div>#students[ i ]#</div>" );
	}

	// for( i in students )
	// {
	// 	WriteOutput( "<div>#i#</div>" );
	// }
</cfscript>

<cfoutput>
	<!--- <cfloop from="1" to="#ArrayLen( students )#" index="i">
		<div>#students[ i ]#</div>
	</cfloop> --->

	<!--- <cfloop array="#students#" index="i">
		<div>#i#</div>
	</cfloop> --->
</cfoutput>

<cfscript>
	// students = [ "Steph", "Chino", "Abe", "Sergio", "Frank", "Chi" ];

	// students.each( function( element, index, array ) {
	// 	writeOutput( "<div>#index#:#element#</div>" );
	// });

	// WriteOutput( element );
	// WriteOutput( index );
	// WriteOutput( array );
</cfscript>
```

### Looping Over Structures

```cfm
<cfscript>
	userInfo = {
		name = "Joey Ramone",
		age  = 25,
		hairColor = "black",
		weight = "200lbs",
		address = "123 Main Street",
		city = "Brooklyn",
		state = "CA",
		postalCode = "11321",
		email = "joey@ramones.biz"
	};

	userInfo[ "height" ] = "5 foot 8";

	for( item in userInfo )
	{
		WriteOutput( "<div>#item#</div>" );
		// WriteOutput( "<div>#userInfo[ item ]#</div>" );
		// WriteOutput( "<div>#item#: #userInfo[ item ]#</div>" );
	}

	// userInfo.each( function( key, value ){
	// 	// WriteOutput( "<div>#key#</div>" );
	// 	// WriteOutput( "<div>#value#</div>" );
	// 	WriteOutput( "<div>#key#: #userInfo[ key ]#</div>" );
	// });
</cfscript>
```

### Break and Continue

```cfm
<cfscript>
    WriteOutput("<ul>");
    for( i = 1; i <= 10; i++ )
	{
        //if(i == 5)
        //{
        //    break;
        //} 
        WriteOutput( "<li>I is : #i#</li>" );
	}
    WriteOutput("</ul>");
</cfscript>

<!---
<ul>
    <cfloop index="i" from="1" to="10">
        <cfif i EQ 5>
            
        </cfif>
        <cfoutput><li>I is #i#</li></cfoutput>
    </cfloop>
</ul>
--->

<p>Whatever comes after the loop</p>
```

---

## Functions

### Simple Functions

```cfm
<cfscript>
	function sayHello()
	{
		WriteOutput( "<p>Hello from ColdFusion!</p>" );
	}

	sayHello();
	sayHello();
	sayHello();
	sayHello();
	sayHello();
</cfscript>
```

### Function Arguments

```cfm
<cfscript>
	function sayHello( myName )
	{
		WriteOutput( "<p>Hello, #arguments.myName#</p>" );
	}

	sayHello( "Nolan" );
	sayHello( "Alvin" );
	sayHello( "Simon" );
	sayHello( "Theodore" );
	sayHello( "Ziggy" );	

	//////////////////////
	// Multiple arguments
	//////////////////////

	// function computeAverage( test1, test2, test3 )
	// {
	// 	var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

	// 	WriteOutput( "<p>The average is #average#</p>" );
	// }

	// computeAverage( 99, 100, 87 );
	// computeAverage( 100, 77, 91 );
	// computeAverage( 91, 81, 84 );
	// computeAverage( 55, 88, 91 );
</cfscript>
```

### Required and Optional Arguments

```cfm
<cfscript>
	function computeAverage( required test1, required test2, required test3, testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 99, 100, 55 );
	computeAverage( 99, 100, 55 );
</cfscript>
```

### Argument Types

```cfm
<cfscript>
	function computeAverage( required numeric test1, required numeric test2, required numeric test3, string testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 65, 77, 87 );
	computeAverage( 99, 35, 25, "English" );
</cfscript>
```

### Passing Arguments

```cfm
<cfscript>
	function computeAverage( required test1, required test2, required test3, testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 99, 100, 55 );
	computeAverage(test1=99, test2=100, test3=55);

	args1 = {
		test1 = 99,
		test3 = 55,
		test2 = 100
	};
	computeAverage( argumentCollection=args1 );

	computeAverage( 99, 100, 55, "History" );
	computeAverage( test1=99, test2=100, test3=55, testType="History" );

	args2 = {
		test1 = 99,
		test2 = 100,
		test3 = 55,
		testType = "History"
	};
	computeAverage( argumentCollection=args2 );
</cfscript>
```

### Return Values (Example A)

```cfm
<cfscript>
	numeric function computeAverage( test1, test2, test3 )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		return average;
	}

	void function display( required string answer, string testType )
	{
		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #answer#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #answer#</p>" );	
		}
	}

	average1 = computeAverage( 43, 100, 87 );
	display( average1 );

	average2 = computeAverage( 55, 77, 91 );
	display( average2, "English" );

	average3 = computeAverage( 100, 81, 84 );
	display( average3, "History" );

	average4 = computeAverage( 8, 42, 91 );
	display( average4 );
</cfscript>
```

### Return Values (Example B)

```cfm
<cfscript>
	function computeAverage( test1, test2, test3 )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		return average;
	}

	any function display( required string answer, string testType )
	{
        var output = "";

		if( StructKeyExists( arguments, "testType" ) )
		{
			output = "<p>The #arguments.testType# average is #answer#</p>";
		}
		else 
		{
			output = "<p>The average is #answer#</p>";
        }
        
        return output;
	}

	average1 = computeAverage( 43, 100, 87 );
    formattedOutput = display( average1 );
    WriteOutput( formattedOutput );

	average2 = computeAverage( 55, 77, 91 );
    formattedOutput = display( average2, "English" );
    WriteOutput( formattedOutput );

	average3 = computeAverage( 100, 81, 84 );
    formattedOutput = display( average3, "History" );
    WriteOutput( formattedOutput );

	average4 = computeAverage( 8, 42, 91 );
    formattedOutput = display( average4 );
    WriteOutput( formattedOutput );
</cfscript>
```

### Function Tags

```cfm
<cffunction name="computeAverage" returntype="numeric">
    <cfargument name="test1" type="numeric" required="true"/>
    <cfargument name="test2" type="numeric" required="true"/>
    <cfargument name="test3" type="numeric" required="true"/>
    
    <cfset var average = (arguments.test1 + arguments.test2 + arguments.test3) / 3 />

    <cfreturn average />
</cffunction>

<cfoutput>
    <p>The average is #computeAverage(55,89,12)#</p>
</cfoutput>
```

---

## Scopes

### Variables Scope

```cfm
<cfset fName = "Damien" />
<cfset age = 43 />
<cfset favoriteBands = ["Genesis", "Simple Minds", "Tool", "Opeth"] />
<cfset address = {
    city = "Thuin",
    zip = 6530,
    country = "Belgium"
} />
<cfoutput>
    <p>The name is #fName#, and the age is #age#</p>
</cfoutput>

<!--- <cfdump var="#variables#" /> --->

<!--- <cfoutput>
    <p>There are #variables.count()# variables in the Variables scope.</p>
</cfoutput> --->

<!--- <cfoutput>
    <p>The name is #variables.fName#, and the age is #variables.age#</p>
    <p>The name is #variables['fName']#, and the age is #variables['age']#</p>
</cfoutput> --->

<cfscript>
    // fName = "Damien";
    // age = 43;
    // favoriteBands = ["Genesis", "Simple Minds", "Tool", "Opeth"];
    // address = {
    //     city = "Thuin",
    //     zip = 6530,
    //     country = "Belgium"
    // };

    // writeOutput("<p>The name is #fName#, and the age is #age#</p>");

    // writeDump(variables);

    // writeOutput("<p>There are #variables.count()# variables in the Variables scope.</p>");

    // writeOutput("<p>The name is #variables.fName#, and the age is #variables.age#</p>");
</cfscript>
```

### Function Variable Scope

```cfm
<cfscript>
    variables.fName = "Andrew";
    variables.lName = "Fletcher";

    // writeDump(var=variables, label = 'the global Variables scope');
    
    string function sayHello (){
        var greeting = "Hello";
        //var fName = "Dave";
        //var lName = "Gahan";

        // writeDump(var = local, label = "The local var scope of the function");

        return greeting & ' ' & variables.fName & ' ' & variables.lName & '.';
    }

    writeOutput("<p>#sayHello()#</p>");
    writeOutput("<p>#greeting & ' ' & variables.fName & ' ' & variables.lName#</p>")
</cfscript>
```

### CGI Scope

```cfm
<cfscript>
	writeDump(cgi);

	// cgi.custom = "Some Text";
</cfscript>
```

### Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the main Application.cfc file</p>"); 
}
```

### Blog App Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the blog app Application.cfc file</p>"); 
}
```

### Blog App Main File

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	
</body>
</html>
```

### Message Board App Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the message board app Application.cfc file</p>"); 
}
```

### Message Board App Main File

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>
	
</body>
</html>
```

### Older Application.cfm vs Application.cfc

#### Application.cfc
```cfc
component 
{
	writeoutput("<p>I am the blog app Application.cfc file</p>"); 
}
```

#### Application.cfm
```cfm
<p>I am the older Application.cfm file</p>
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	
</body>
</html>
```

### Application Scope

#### Blog App Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	//this.name = "MyApp";

	//this.applicationTimeout = createTimespan(0, 2, 0, 0);
}
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<cfset application.color =  "red" />
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<p>To the <a href="login.cfm">Login page</a></p>
	<!--- <cfdump var="#application#" /> --->
</body>
</html>
```

#### Blog App Login Page
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Please login to the app</h1>
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<p>To the <a href="blogApp.cfm">BlogApp page</a></p>
</body>
</html>
```

#### Message Board App Application.cfc
```cfc
component 
{
	this.name = "MyMessageBoardApp";
	//this.name = "MyApp";

	//this.applicationTimeout = createTimespan(0, 4, 0, 0);
}
```

#### Message Board App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>

	<cfset application.color = "green" />
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<!--- <cfdump var="#application#" /> --->
	
</body>
</html>
```

### Session Scope

#### Application.cfc with Session Management
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
	
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 45, 0);// 45 mins
	
	public void function onSessionStart() {
		
		//set some defaults in the session scope
		session.created = Now();
		session.userAgent = cgi.http_user_agent;
	}
}
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<p>To the <a href="login.cfm">Login page</a></p>
	<cfdump var="#session#" />
</body>
</html>
```

#### Blog App Login Page
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Please login to the app</h1>
	<p>To the <a href="blogApp.cfm">BlogApp page</a></p>
	<cfdump var="#session#" />
	
</body>
</html>
```

### Session ID and Cookies

#### Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
	
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 45, 0);// 45 mins
	
	public void function onSessionStart() {
		
		//set some defaults in the session scope
		session.created = Now();
		session.userAgent = cgi.http_user_agent;
	}
}
```

#### Blog App Main File with Cookies
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<p>To the <a href="login.cfm">Login page</a></p>
	<cfdump var="#session#" />
	
	<!--- <cfcookie  name="myCookie" value="myValue" /> --->

	<!--- <cfdump var="#cookie#" /> --->
</body>
</html>
```

### Server Scope

#### Blog App Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
}
```

#### Blog App Main File with Server Scope
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>

	<cfdump var="#server#" />
	
	<!--- <cfset server.companyName = "CF Specialists INC." />
	
	<cfoutput>
	<p>This site belongs to the #server.companyName# company.</p>
	</cfoutput> --->
</body>
</html>
```

#### Message Board App Application.cfc
```cfc
component 
{
	this.name = "MyMessageBoardApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
}
```

#### Message Board App Main File Using Server Scope
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>
	
	<cfoutput>
	<p>This site belongs to the #server.companyName# company.</p>
	</cfoutput>
	
</body>
</html>
```

### Locking

```cfm
<cfscript>
	application.totalTicketsSold = application.totalTicketsSold + myNewticketOrder;

	// lock scope="Application" timeout="10" type="Exclusive"
	// {
	// 	application.totalTicketsSold = application.totalTicketsSold + myNewticketOrder;
	// }
</cfscript>

<!--- 
One user on the site:
1. CF retrieves the value for application.totalTicketsSold.
2. CF adds that value to myNewticketOrder.
3. CF then combines those 2 as the -NEW- value for application.totalTicketsSold.
--->

<!--- 
Two users on the site at the same time:
1. User 1 starts to run that line of code. application.totalTicketsSold is 105.
2. User 2 starts to run that line of code. application.totalTicketsSold is 105. 
3. User 1 adds 5 tickets, making the total 110.
4. User 2 adds 2 tickets, making the total 107.
5. User 1 saves the new total back into application.totalTicketsSold as 110.
6. User 2 saves the new total back into application.totalTicketsSold as 107.
--->

<!--- 
Two users w/ locks in place: 
1. User 1 starts, hits the lock tag, and aquires the lock.
2. User 1 runs the line of code, application.totalTicketsSold is 105.
3. User 2 starts to run the code, hits the lock. Because User 1 has aquired the lock, User 2 waits here.
4. User 1 adds 5 tickets, making the total 110.
5. User 1 saves the new total back into application.totalTicketsSold as 110.
6. User 1 exits the lock and continues on with the rest of the request.
7. User 2 aquires the lock.
8. User 2 reads application.totalTicketsSold as 110.
9. User 2 adds 2 tickets, making the total 112.
10. User 2 saves the new total of 112 into application.totalTicketsSold.
11. User 2 exits the lock and continues on with the rest of the request.
--->

<!--- For more info:
https://helpx.adobe.com/coldfusion/developing-applications/developing-cfml-applications/using-persistent-data-and-locking/locking-code-with-cflock.html
--->
```