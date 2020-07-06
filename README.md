# digital_cosa
Transformation format for openrefine to XML mods



## Openrefine MODS transformation workflow

Tools Required
- download Openrefine http://openrefine.org/download.html

OpenRefine's scripting language is GREL. Foundations course https://courses.tranzf.org/course/view.php?id=18
- documentation https://github.com/OpenRefine/OpenRefine/wiki/General-Refine-Expression-Language
- understanding expressions https://github.com/OpenRefine/OpenRefine/wiki/Understanding-Expressions


general
artifacts
SU sheets



### General

Remove quotes from Templating
-add .replace('"', '') to the value inputs in the XML
ex, {{jsonize(cells["SU Number"].value).replace('"', '')}}

Fixing Date  
Openrefine will change the date format when a project is opened, and this new format is unwanted. This is h
1. Transform *use the correct year
Expression: slice(value, 4, 10)+" 2014"*
2. Transform
Expression: value.toDate().toString('yyyy-MM-dd')

###Catalogued Objects (CO)###

DO NOT store blank rows
DO NOT store blank cells as null

Be sure that the spellings of the columns are the same as in the CO template.

DELETE Columns
- 'Cat. Sheet'
- 'Date Found'
- 'Date Catalogued'
- 'Photo Num.'
- 'Photos'
- 'Drawings'
- 'Bibliography'
- 'Comments'
- 'Date Issued'
1. Edit column -> Remove this column

Rename 'Brief Identification' to 'Object'
1. 'Brief Identification' -> Edit Column -> Rename this column
2. In the popup window type 'Object'

Rename 'Sp.Obj.' to 'Special'
1. 'Sp.Obj.' -> Edit Column -> Rename this column
2. In the popup window type 'Special'

Rename 'Detailed Description' to 'Description'
1. 'Detailed Description' -> Edit column -> Rename this column
2. In the popup window type 'Description'

Split 'Locus/SU' into two columns if not already
1. 'Locus/SU' -> Split into several columns
2. by separator '.'
3. Deselect 'Remove this column' to be safe
3. OK
4. Rename first column 'Locus'; Rename second column 'SU'
5. Remove original column

Remember to change the <recordCreationDate> value in the template to today's date.


### SU Sheets

Generating purls using Cataloged Objects column
1. Click on Cataloged Objects Column
2. Click 'add column based on this column'
3. Name: Purl
4. 'set to blank'
5. Expression: forEach(value.split(", "), v, "http://purl.flvc.org/fsu/fd/FSU_Digital_Cosa_" + v)

Dealing with notes for Covers, Cuts, Cut By, etc.
Both grel expressions work, however one of them evaluates for blank cells which is best practice for coding in general
Expression w/ eval: {{forNonBlank(cells["Covers"], c, jsonize(c.value), "").replace('"', '')}}
Expression w/o eval: {{jsonize(cells["Covered By"].value).replace('"', '')}}

Correcting the Season if incorrect
Expression: replace(value, "Fall", "Summer")

Create column for recordCreationDate
1. Select 'SU Number' column and click 'add column based on column SU Number' (it can really be any column, I'm just picking SU Number for indecisive folks)
2. New Column Name: Record Date
3. select 'set to blank'
4. Expression: now().toString('yyyy-MM-dd')
5. Click 'OK'
