header="<frontmatter>\nlayout: default.md\npageNav: 3\npageNavTitle: \"Chapters of This Page\"\n<\/frontmatter>\n\n<br>\n\n"

# Format filenames
for file in contents/*.md ; do
    mv "$file" "`echo $file | sed -e 's/##//' -e 's/ /-/g'`"
done;

for file in contents/*.md ; do
    # Add markbind header to markdown files
    sed -i "1s/^/$header/" "$file"
    # sed -i "s/images\//..\/images\//" "$file"
    # sed -i "s/solutions\//..\/solutions\//" "$file"
    
    # print formatted nav item
    base=`basename "$file" .md`
    echo -e "* [$base]({{baseUrl}}/contents/$base.html)"
done;

for folder in solutions/system_design/* ; do
    file="$folder/README.md"

    if [ -f "$file" ]; then
        # Add markbind header to markdown files
        sed -i "1s/^/$header/" "$file"

         # print formatted nav item
        base=`basename "$folder"`
        echo -e "<li><a href=\"{{baseUrl}}/$folder/readme.html\" class=\"dropdown-item\">$base</a></li>"
    fi
done;