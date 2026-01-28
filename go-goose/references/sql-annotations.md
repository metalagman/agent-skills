# SQL migration annotations

## Core structure
- SQL migrations are `.sql` files with annotations on their own lines.
- Annotations are written as `-- +goose <Token>`, are case-insensitive, and must start at the beginning of the line.
- The `Up` block is required; the `Down` block is optional and must appear after `Up`.

## Common annotations
- `-- +goose Up`: start the Up section
- `-- +goose Down`: start the Down section
- `-- +goose StatementBegin` / `-- +goose StatementEnd`: wrap statements that contain internal semicolons (e.g., PL/pgSQL functions)
- `-- +goose NO TRANSACTION`: run this migration without a transaction
- `-- +goose ENVSUB ON|OFF`: enable or disable environment variable substitution

## Statement rules
- Goose splits statements on `;` within the current section.
- Use `StatementBegin/StatementEnd` to keep a block together when `;` is part of the statement body.
