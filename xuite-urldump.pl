#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

use WWW::Mechanize;

INIT {
    my $baseurl = shift @ARGV or die $!;

    #
    my $ua = WWW::Mechanize->new;

    my $res = $ua->get($baseurl);

    # Find max page (last page)
    my $lastpage = 1;
    foreach my $link ($ua->links) {
        my $url = $link->url_abs;

        if ($url =~ m{^\Q${baseurl}\E\?&p=(\d+)$}) {
            $lastpage = $1 if int $1 > $lastpage;
        }
    }

    # Loop to last page
    my %urls = {};
    for (my $page = 1; $page <= $lastpage; ) {
        foreach my $link ($ua->links) {
            my $url = $link->url_abs;

            if ($url =~ m{^\Q${baseurl}\E/\d+$}) {
                next if defined $urls{$url};

                $urls{$url} = 1;
                say $url;
            }
        }

        $page++;
        $ua->get($baseurl . '?&p=' . $page);
    }
}

__END__
