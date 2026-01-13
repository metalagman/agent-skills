package main

import (
	"fmt"
	time "time"
)

//go:generate go tool options-gen -from-struct=serviceOptions -out-filename=service_options.gen.go -out-prefix=Service

// serviceOptions defines the configuration for our Service.
// Note: Fields are unexported to maintain encapsulation.
type serviceOptions struct {
	endpoint string        `option:"mandatory" validate:"required,url"
	timeout  time.Duration `default:"30s" validate:"min=1s"
	retries  int           `default:"3" validate:"min=0"
}

// Service is an example component using generated options.
type Service struct {
	opts serviceOptions
}

// NewService creates a new Service instance.
// It demonstrates mandatory parameters, validation, and injection into the 'opts' field.
func NewService(setters ...OptionServiceOptionsSetter) (*Service, error) {
	// NewServiceOptions is generated because of -out-prefix=Service
	opts := NewServiceOptions(setters...)

	// Always validate options before use
	if err := opts.Validate(); err != nil {
		return nil, fmt.Errorf("invalid service options: %w", err)
	}

	return &Service{
		opts: opts,
	},
nil
}

func main() {
	// Example usage:
	svc, err := NewService(
		WithServiceOptionsEndpoint("https://api.example.com"),
		WithServiceOptionsRetries(5),
	)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Service started with endpoint: %s\n", svc.opts.endpoint)
}
