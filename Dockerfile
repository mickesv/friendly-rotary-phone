FROM cgr.dev/chainguard/go:latest as builder

# Set the working directory inside the container
WORKDIR /app

COPY . .

# Download dependencies
RUN go mod init main
RUN go get github.com/gin-gonic/gin
RUN go mod download

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Does some magic. Creates "super minimal" image. Removes fluff
FROM scratch

# Copy the compiled application binary from the builder image
COPY --from=builder /app/main /app/main

# Expose port 8080
EXPOSE 8080

# CMD to run program
CMD ["/app/main"]
