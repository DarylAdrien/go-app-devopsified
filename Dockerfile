# Use Golang as the builder image
FROM golang:1.22.5 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the application (create a binary named 'app')
RUN go build -o app .

#######################################################
# Use a minimal base image for the final container
FROM gcr.io/distroless/base

# Set working directory
WORKDIR /app

# Copy only the compiled binary from the builder stage
COPY --from=builder /app/app .

COPY --from=builder /app/static ./static

# Expose the port your application listens on
EXPOSE 9090

# Run the compiled Go binary
CMD ["./app"]
