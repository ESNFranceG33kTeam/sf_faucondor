<?php

use Doctrine\Common\Annotations\AnnotationRegistry;
use Composer\Autoload\ClassLoader;

/**
 * @var ClassLoader $loader
 */
$loader = require __DIR__.'/../vendor/autoload.php';
$loader->add(null, __DIR__.'/../vendor/jasig/phpcas/source');

AnnotationRegistry::registerLoader(array($loader, 'loadClass'));

return $loader;
