# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Post.delete_all
User.delete_all
Tag.delete_all
PostTag.delete_all

# nose si esto es necesario pero ya lo hice nomas... odio ruby...
i = 0
j = 0
k = 0
q = 0

#requirements:
    # 5 users, 10 posts, 5 tags
    # each user should have one post minimum
    # each post should have at least one tag
    # each tag should be associated with at least one post

# creacion de usuario John Doe!!
User.create(
    name: "John Doe",
    password: "12345678",
    email: "elpepe123@elpepe.cl"
)

4.times do
    # i will be 0, 1, 2, 3
    User.create(
        name: Faker::Name.unique.name,
        password: Faker::Internet.password(min_length: 6),
        email: Faker::Internet.email(domain: 'gmail.com')
    )
end

5.times do |k|
    Tag.create(
        name: ["Tag ", k + 1].join('')
    )
end

#father_post_id: cada usuario va a tener dos posts: uno que no es respuesta a otro, y un segundo que si lo es!

#primero se crean los posts "padres" (estos poseen father_post_id: nil)
5.times do |j|
    Post.create(
        title: ["Post ", j + 1].join(''),
        content: Faker::Quote.matz,
        #published_at should be assigned to Time.now in its model
        #answers_count will be modified after all posts have been created
        likes_count: Random.rand(0..1000),

        user_id: j + 1,                
    )
end

#luego, se crean los hijos (father_post_id no es nil)
5.times do |j|

    father = Post.pluck(:id).sample
    Post.create(
        title: ["Post ", j + 6].join(''),
        content: Faker::Quote.matz,
        #published_at was assigned a value of Time.now inside the posts model
        likes_count: Random.rand(0..1000),
    
        user_id: j + 1,
        father_post_id: father,
    )

    aaa = Post.find_by(id: father)
    aaa.update(answers_count: aaa.answers_count + 1)
end


5.times do |q|
    PostTag.create(
        post_id: q + 1,
        tag_id: q + 1
    )
end

5.times do |q|
    PostTag.create(
        post_id: q + 6,
        tag_id: Tag.pluck(:id).sample
    )
end