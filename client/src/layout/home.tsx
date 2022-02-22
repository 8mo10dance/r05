import React from 'react'
import { AppBar, Box, Toolbar, Typography, IconButton } from '@mui/material'
import { Menu } from '@mui/icons-material'

export type Props = {
  title: string
}

const Layout: React.FC<Props> = ({ title, children }) => {
  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton
            size="large"
            edge="start"
            color="inherit"
            aria-label="menu"
            sx={{ mr: 2 }}
          >
            <Menu />
          </IconButton>
          <Typography variant="h6" component="h1" sx={{ flexGrow: 1 }}>
            {title}
          </Typography>
        </Toolbar>
      </AppBar>
      <Box p={2}>{children}</Box>
    </Box>
  )
}

export default Layout
