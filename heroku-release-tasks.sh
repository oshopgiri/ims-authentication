#!/usr/bin/env bash
bin/rails db:migrate
bin/bundle exec rake eureka:register_instance
