import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

const createSocket = (topicID) => {
  let channel = socket.channel(`comment:${topicID}`, {})
  channel.join()
    .receive("ok", resp => {
        console.log(`Joined successfully! Resp received, with ${resp.comments.length} comments`)
        return renderComments(resp.comments) 
      }
    )
    .receive("error", resp => { console.log("Unable to join", resp) })

    document.querySelector('button').addEventListener("click", () => {
      const content = document.querySelector('textarea').value
      channel.push('commend:add', { content: content })
    })

  channel.on(`comment:${topicID}:new`, renderNewComment)
}

function renderComments(comments) {
  const renderedComments = comments.map(comment => {
    return genCommentHTML(comment)
  })

  document.querySelector(".collection").innerHTML = renderedComments.join('')
}

function renderNewComment(event) {
  const renderedComment = genCommentHTML(event.comment)
  document.querySelector(".collection").innerHTML += renderedComment
}

function genCommentHTML(comment) {
  let email = "Anonymous"
  if (comment.user) {
    email = comment.user.email
  }

  return `
    <li class="collection-item">
      ${comment.content}
      <div class="secondary-content">
        ${email}
      </div>
    </li>
  `
}

window.createSocket = createSocket
