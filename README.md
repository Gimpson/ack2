ack 2.0 is a text searching utility optimized for searching trees of source code.

# Incompatibilities with ack 1.x

ack 2 makes some big changes in its behaviors that could trip up
users who are used to the idiosyncracies of ack 1.x.  These changes
could affect your searching happiness, so please read them.

* ack's default behavior is now to search all files that it identifies
as being text.  ack 1.x would only search files that were of a file
type that it recognized.

* Removed the `-a` and `-u` options since the default is to search
all text files.

* Removed the `--binary` option.  ack 2.0 will not find and search
through binary files.

* Removed the `--skipped` option.

* Removed the `--invert-file-match` option.  `-v` now works with `-g`.

    # List files that do not match /foo/
    ack -g foo -v

* `-g` now obeys all regex options: `-i`, `-w`, `-Q`, `-v`

* Removed the `-G` switch, because it was too confusing to have two
regexes specified on the command line.  Now you use the `-x` switch
to pipe filenames from one `ack` invocation into another.

    # Search files with filename matching "sales" for the string "foo"
    ack -g sales | ack -x foo

# New features in ack 2.0

ack 2.0 will:

* by default search all text files, as identified by Perl's `-T` operator
    * We will no longer have a `-a` switch.

* improved flexibility in defining filetype selectors
    * glob-style matching (`*.pl` identifies a Perl file)
    * regex-style matching (`/\.pl$/i` identifies a Perl file)
    * shebang-line matching (shebang line matching `/usr/bin/perl/` identifies a Perl file)

* support for multiple ackrc files
    * global ackrc (/etc/ackrc)
        * https://github.com/petdance/ack/issues/#issue/79
    * user-specific ackrc (~/.ackrc)
    * per-project ackrc files (~/myproject/ackrc)

* all inclusion/exclusion rules will be in the ackrc files
    * ack 2.0 will have no hardcoded filetype specifications,
    directories to include or exclude, and so on.  It will ship
    with a default global ackrc, but does not need it.
