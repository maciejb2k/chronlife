{ pl: { i18n: { plural: { keys: %i[one few other],
                          rule: lambda { |n|
                                  if n == 1
                                    :one
                                  elsif [2, 3, 4].include?(n)
                                    :few
                                  else
                                    :other
                                  end
                                } } } } }
