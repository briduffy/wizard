import React from 'react'
import { Container, Header, Segment, Divider } from 'semantic-ui-react'
import TagForm from './TagForm'

const Tags = () => (
  <Container>
    <Divider hidded />
    <Segment padded>
      <Header as='h3'>Create a Video Game Tag</Header>
      <TagForm />
    </Segment>
  </Container>
)

export default Tags