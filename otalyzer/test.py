#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import unittest, app

class WebTests(unittest.TestCase):
    def test_login(self):
        print(">> Running UnitTest for: Login")
        app.main()

