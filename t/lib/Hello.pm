{
    package Hello;
    use base qw(Squatting);
}

{
    package Hello::Controllers;
    use Squatting ':controllers';

    our @C = (
        C( Home => ['/'],
           get => sub {
               my $self = shift;
               $self->v->{title} = "Hello world";
               $self->v->{message} = "Your name: " . $self->input->{name};
               $self->render('home');
           } ),
    );
}
{
    package Hello::Views;
    use Squatting ':views';

    our @V = (
        V(
            'html',
            layout => sub {
                my($self, $v, $content) = @_;
                "<html><head><title>$v->{title}</title></head>".
                "<body>$content</body></html>";
            },
            home => sub {
                my($self, $v) = @_;
                "<h1>$v->{message}</h1>",
            },
        ),
    );
}

1;
