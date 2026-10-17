# Locale Guard demo: Rails

A small Rails bookshop in English, Arabic, German and Japanese, translated with
the [Rails I18n API](https://guides.rubyonrails.org/i18n.html). Every YAML file
is wrapped in its locale key (`en:`), each language has more than one file
(`en.yml` and `cart.en.yml`), and plurals use the rules of
[rails-i18n](https://github.com/svenfuchs/rails-i18n): six forms in Arabic, one
in Japanese. It shows what
[Locale Guard](https://github.com/Mohamed-Almarag/locale-guard) reports on real
pull requests.

## Setup

| | |
|---|---|
| Framework | Rails 8.1 |
| Translation library | Rails I18n, with plural rules from `rails-i18n` |
| Locale files | `config/locales/{locale}.yml` and `config/locales/*.{locale}.yml`, merged per language |
| Base locale | `en` |

The whole setup is one workflow file,
[.github/workflows/translations.yml](.github/workflows/translations.yml):

```yaml
- uses: Mohamed-Almarag/locale-guard@v1
  with:
    files: |
      config/locales/{locale}.yml
      config/locales/*.{locale}.yml
    format: json
```

Locale Guard reads the locale key as the wrapper, not as part of each key, so
`en: { books: { title: … } }` is the key `books.title`. A Rails plural is a key
whose children are only plural forms, like `books.count.one` and
`books.count.other`.

## Pull requests to look at

| Pull request | What it shows | Result |
|---|---|---|
| [#1 Add book reviews](https://github.com/Mohamed-Almarag/locale-guard-demo-rails/pull/1) | A new file German never got, so the copy-paste block is a whole `reviews.de.yml` under `de:`; an Arabic plural with two of its six forms; a renamed `%{name}` in Japanese; an extra key | ❌ Fails |
| [#2 Add a wishlist](https://github.com/Mohamed-Almarag/locale-guard-demo-rails/pull/2) | The first commit forgets German and Japanese, the second one adds them, and the same comment turns green | ✅ Passes |
| [#3 Space out the book list](https://github.com/Mohamed-Almarag/locale-guard-demo-rails/pull/3) | A change that touches no translation file, so the check finishes in seconds | ✅ Passes |

The `main` branch already has two old issues: a key German never got, and an
empty Japanese value. Locale Guard lists them apart from the issues each pull
request adds, collapsed, and they do not fail the check.

## Run the app

```bash
bundle install
bin/rails server
```

Then open http://localhost:3000 and pick a language.
