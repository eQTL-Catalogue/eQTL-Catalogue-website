# EQTL

See:

- Live: https://www.ebi.ac.uk/eqtl/
- Dev: https://wwwdev.ebi.ac.uk/eqtl/

## Local dev

### Docker Compose

For development the easiest thing to do is to run Jekyll in watch mode locally. There's a docker-compose config to do that.

```
docker-compose up -d --build
open http://localhost:8000/eqtl
```

## Production deployment

In reality this is all handled by GitLab.

- Commits are deployed to wwwdev
- Tags are deployed to www

Details below if you're interested.
