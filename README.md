# Forge

## Project

- title
- description
- deadline_on
- bid:integer
- requested_by (User)
- authorized_by (User)
- attachments
- comments
- submissions

## Comment

- project
- author (User)
- message

## User

- name
- email
- role
- projects (as author)
- submissions (as author)

## Submission

- project
- author (User)
- accepted_by
- status [draft, final]
- memo
- attachments
- is_paid

# TODOS

- [ ] NavBar
- [ ] Date fields (`Admin::Projects`)
- [ ] Better bid field (`Admin::Projects`)
- [ ] Better error field
