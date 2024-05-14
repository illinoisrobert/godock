docker build --no-cache -t ghcr.io/illinoisrobert/stack-overflow-go-docker:v1.0 .
# docker run --env YOUR_VAR=your-value ghcr.io/illinoisrobert/stack-overflow-go-docker:v1.0
docker run -it --rm --env YOUR_VAR=your-value ghcr.io/illinoisrobert/stack-overflow-go-docker:v1.0 bash
