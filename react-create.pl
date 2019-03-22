#!/usr/bin/perl

#
#   react-create.pl
#   Jeremy Moyers
#   3/21/2019
#
#   react-create creates template files for react.js applications.
#

use strict;
use Getopt::Long;

my $project = 'Disability Insurance Services';
my $author = 'Jeremy Moyers';
my $date = localtime();
my $company = 'Seamgen, LLC';


my $container = '';
my $component = '';
my $help = '';

GetOptions ('con' => \$container, 'com' => \$component, 'help' => \$help);

my $help_message = <<"END_MESSAGE";
usage:
react-create --arg [classname]
--con - creates a .jsx container in the containers dir if it exists.
--com - creates a .jsx component in the components dir if it exists.
no opts - creats an empty .jsx file in the working dir.

if the specified directory (container|component) does not exist, the .jsx is placed in the current working dir.
END_MESSAGE

if ($help == 1) {
    print $help_message;
    exit;
}

if (@ARGV == 0) {
    print "Insufficient arguments: class name required.\n";
    exit;
}

my $classname = $ARGV[0];
my $filename = $classname . '.jsx';

my $header = <<"END_MESSAGE";
//
//  $filename
//  $project
//
//  Created by $author on $date
//  Copyright $company. All rights reserved.
//

END_MESSAGE

my $component_template = <<"END_TEMPLATE";
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '\@material-ui/core/styles';

const propTypes = {

};

class $classname extends Component {
    render() {
        return (<div />);
    }
}

$classname.propTypes = propTypes;

export default $classname;
END_TEMPLATE


if ($container == 1) {
    if (-e -d "containers") {
        $filename = "containers/$filename";
    }
    open(my $fh, ">", $filename) or die "can't open $filename\n";
    print $fh $header;
    print $fh $component_template;
    close($fh);
    exit;
}

if ($component == 1) {
    if (-e -d "components") {
        $filename = "containers/$filename";
    }
    open(my $fh, ">", $filename) or die "can't open $filename\n";
    print $fh $header;
    print $fh $component_template;
    close($fh);
    exit;
}

$filename = $classname . '.js';
open(my $fh, ">", $filename) or die "can't open $filename\n";
print $fh $header;
close($fh);



