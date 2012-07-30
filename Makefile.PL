
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Flexible I18N using Locale::Maketext::Lexicon for Dancer apps",
  "AUTHOR" => "Clinton Gormley <drtech\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-Plugin-Lexicon",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer::Plugin::Lexicon",
  "PREREQ_PM" => {
    "Dancer" => 0,
    "Dancer::Plugin" => 0,
    "File::Spec::Functions" => 0,
    "I18N::LangTags" => 0,
    "I18N::LangTags::Detect" => 0,
    "I18N::LangTags::List" => 0,
    "Package::Stash" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



