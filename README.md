# Facebook Clone

We are building a facebook like application by putting together some of the core features of the platform – users, profiles, “friending”, posts, news feed, and “liking”. We will also implement sign-in with the real Facebook by using Omniauth and Devise. [facebook](htts://facebook.com)


## Technologies

- HTML 
- CSS
- SASS
- Ruby
- Ruby on Rails

## Usage

> Clone the repository to your local machine

```
$ git clone git@github.com:rOluochKe/facebook-clone.git
```

> cd into the directory

```
$ cd facebook-clone
```

> Then install the needed gems (while skipping any gems needed only in production):

```
$ bundle install --without production
```

> Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

> If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Functionalities

- Create an account
- Login to your account
- Create a feed
- Like and comment on a feed
- Add other people as your friends
- Logout of the application

## Designed and developed by

[Phemia Ampaire](https://github.com/ampaire) &&
[Raymond Oluoch](https://github.com/rOluochKe)

## Contributing

1. Fork it (git clone git@github.com:rOluochKe/facebook-clone/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details.