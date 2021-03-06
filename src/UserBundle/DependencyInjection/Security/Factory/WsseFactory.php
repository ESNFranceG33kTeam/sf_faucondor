<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 02/07/15
 * Time: 12:18
 */

namespace UserBundle\DependencyInjection\Security\Factory;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Reference;
use Symfony\Component\DependencyInjection\DefinitionDecorator;
use Symfony\Component\Config\Definition\Builder\NodeDefinition;
use Symfony\Bundle\SecurityBundle\DependencyInjection\Security\Factory\SecurityFactoryInterface;

class WsseFactory implements SecurityFactoryInterface
{
    public function create(ContainerBuilder $container, $id, $config, $userProvider, $defaultEntryPoint)
    {

        $providerId = 'security.authentication.provider.wsse.'.$id;

        $container->setDefinition($providerId, new DefinitionDecorator('wsse.security.authentication.provider'))
                  ->replaceArgument(0, new Reference($userProvider));

        $listenerId = 'security.authentication.listener.wsse.'.$id;

        $container->setDefinition($listenerId, new DefinitionDecorator('wsse.security.authentication.listener'));

        return array($providerId, $listenerId, $defaultEntryPoint);
    }

    public function getPosition()
    {
        return 'pre_auth';
    }

    public function getKey()
    {
        return 'wsse';
    }

    public function addConfiguration(NodeDefinition $node)
    {
        $node
            ->children()
            ->scalarNode('lifetime')->defaultValue(300)
            ->end();
    }
}