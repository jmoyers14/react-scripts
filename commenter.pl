my @my_file_paths = split /^/m, `git ls-files`;

while(my $line = <@my_file_paths>) {

    if ($line =~ m/\/([a-zA-z]+\.[a-zA-z]+$)/) {
        comment ($1, $line);
    }
}

sub comment {

    my $project = 'Disability Insurance Services';
    my $author = 'Jeremy Moyers';
    my $date = localtime();
    my $company = 'Seamgen, LLC';
    my $filename = shift;
    my $path = shift;

my $header = <<"END_MESSAGE";
/**
 *  $filename
 *  $project
 *
 *  Created by $author on $date
 *  Copyright $company. All rights reserved.
 */
END_MESSAGE

    open my $in, $path or die "could not open $path\n";
    local $/ = undef;
    my $content = <$in>;
    close $in;

    open my $out, '>', $path or die "could not open $path\n";
    print $out $header;
    print $out $content;
}
