import React from 'react'
import {
  Box,
  Card,
  CardActions,
  CardContent,
  CardHeader,
  IconButton,
  Typography,
  Menu,
  MenuItem,
} from '@mui/material'
import { MoreVert, IosShare } from '@mui/icons-material'

export type Props = {
  title: string
  content: string
}

const MemoCard: React.FC<Props> = ({ title, content }) => {
  const [anchorEl, setAnchorEl] = React.useState<HTMLElement>(null)

  return (
    <Card>
      <CardHeader
        action={
          <IconButton onClick={(event) => setAnchorEl(event.currentTarget)}>
            <MoreVert />
          </IconButton>
        }
        title={title}
      />
      <Menu
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={() => setAnchorEl(null)}
      >
        <MenuItem onClick={() => setAnchorEl(null)}>編集</MenuItem>
        <MenuItem onClick={() => setAnchorEl(null)}>削除</MenuItem>
      </Menu>
      <CardContent>
        <Typography variant="body1">{content}</Typography>
      </CardContent>
      <CardActions>
        <IconButton>
          <IosShare />
        </IconButton>
      </CardActions>
    </Card>
  )
}

export default MemoCard
